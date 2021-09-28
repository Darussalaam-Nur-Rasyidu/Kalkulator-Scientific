import 'package:calcullator_scientific/history_page.dart';
import 'package:calcullator_scientific/Provider/ketelitian_hitung.dart';
import 'package:calcullator_scientific/Provider/riwayat_terakhir.dart';
import 'package:calcullator_scientific/settings_app.dart';
import 'package:flutter/material.dart';
import 'custom_keyboard.dart';
import 'package:expressions/expressions.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'package:math_expressions/math_expressions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        color: Colors.white,
        child: SafeArea(child: KeyboardDemo()),
      ),
    );
  }
}

class KeyboardDemo extends StatefulWidget {
  @override
  _KeyboardDemoState createState() => _KeyboardDemoState();
}

class _KeyboardDemoState extends State<KeyboardDemo> {
  TextEditingController _controller = TextEditingController();
  List<String> riwayat = [];
  bool check = false;

  @override
  void initState() {
    getRiwayat().then((r) {
      riwayat = r ?? [];
    });
    getAkurasi().then((value) {
      akurasi = value ?? 2;
    });
    setState(() {});
    super.initState();
  }

  void saveData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setStringList("riwayat", riwayat);
  }

  Future<int> getAkurasi() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt("akurasi");
  }

  Future<List<String>> getRiwayat() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getStringList("riwayat");
  }

  double factorial(num a) {
    double b = 1;
    for (double i = 2; i <= a; i++) {
      b *= i;
    }
    return b;
  }

  double nPr(num a, num b) {
    return factorial(a) / factorial(a - b);
  }

  double nCr(num a, num b) {
    return factorial(a) / (factorial(a - b) * factorial(b));
  }

  double aBs(num a) {
    double n = -1, m = 1;
    return ((a < 0) ? a *= n : a * m);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Ketelitian>(
          create: (context) => Ketelitian(),
        ),
        ChangeNotifierProvider<RiwayatTerakhir>(
          create: (context) => RiwayatTerakhir(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Row(
            children: [
              Text(
                "\tKalkulator Scientific",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Settings();
                      },
                    ),
                  );
                },
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HistoryPage(riwayat);
                      },
                    ),
                  );
                },
                icon: Icon(
                  Icons.history,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        resizeToAvoidBottomInset: false, //resize false saat terjadi perubahan
        body: Container(
          color: Color(0xffbbbbbb),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 1), //menambahkan ruang kosong diatas textfield
              Expanded(
                flex: 1,
                child: TextField(
                  controller: _controller,
                  maxLines: 4,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),

                  style: TextStyle(fontSize: 24),
                  autofocus: true,
                  showCursor: true, //memperlihatkan kursor
                  readOnly:
                      true, //membuat teks dalam teksfield dapat dirubah atau tidak oleh keyboard asli dari mesin
                ),
              ),

              Consumer<RiwayatTerakhir>(
                builder: (context, riwayatterakhir, _) => Align(
                  alignment: Alignment(0.9, -1),
                  child: Text(
                    ((check) ? riwayatterakhir.riwayat : ""),
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Consumer<RiwayatTerakhir>(
                builder: (context, riwayatterakhir, _) => CustomKeyboard(
                  onTextInput: (myText) {
                    _insertText(
                        myText); //untuk memasukkan isi teks yang diinputkan dari customkeyboard ke teksfield
                  },
                  onBackspace: () {
                    _backspace();
                  },
                  onClear: () {
                    _clear();
                  },
                  onOK: () {
                    _result();
                    riwayatterakhir.riwayat = riwayat[riwayat.length - 1];
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _result() {
    try {
      var context = {
        "p": pi,
        "e": e,
        "sin": sin,
        "arcsin": asin,
        "cos": cos,
        "arccos": acos,
        "tan": tan,
        "arctan": atan,
        "ln": log,
        "log": log,
        "aBs": aBs,
        "fact": factorial,
        "sqrt": sqrt,
        "pow": pow,
        "nPr": nPr,
        "nCr": nCr,
      };
      String inputText = _controller.text, olahText = "";
      int jml = inputText.length, j = 0, i = 0;
      String scanFactorial(String teks) {
        if (teks[teks.length - 1] == ')') {
          int b = 0;
          for (j = teks.length - 1; true; j--) {
            if (teks[j] == ')') {
              b--;
            } else if (teks[j] == '(') {
              b++;
            }
            if (b == 0) {
              j--;
              break;
            }
          }
        } else {
          for (j = teks.length - 1;
              ((teks[j] == '.') ||
                  ((teks.codeUnitAt(j) > 47) && (teks.codeUnitAt(j) < 58)));
              j--) {
            if (j - 1 == -1) {
              j--;
              break;
            }
          }
        }
        j++;
        String str = teks;
        teks = str.replaceRange(j, j, '(fact(');
        teks += "))";
        return teks;
      }

      String scanPangkat(String teks) {
        if (teks[teks.length - 1] == ')') {
          int b = 0;
          for (j = teks.length - 1; true; j--) {
            if (teks[j] == ')') {
              b--;
            } else if (teks[j] == '(') {
              b++;
            }
            if ((b == 0) && (j - 1 != -1)) {
              while (((teks.codeUnitAt(j - 1) > 64) &&
                      (teks.codeUnitAt(j - 1) < 91)) ||
                  ((teks.codeUnitAt(j - 1) > 96) &&
                      (teks.codeUnitAt(j - 1) < 123))) {
                j--;
                if (j == 0) {
                  break;
                }
              }
              j--;
              break;
            } else if (b == 0) {
              j--;
              break;
            }
          }
        } else {
          for (j = teks.length - 1;
              (((teks[j] != ',') &&
                      (teks[j] != '*') &&
                      (teks[j] != '/') &&
                      ((teks[j] != '+') || (teks[j - 1] == 'e'))) &&
                  (((j != 0) ? (teks[j - 1] == 'e') : true) ||
                      (teks[j] != '-') ||
                      ((teks.codeUnitAt(j + 1) > 47) &&
                          (teks.codeUnitAt(j + 1) < 58))));
              j--) {
            if (j - 1 == -1) {
              j--;
              break;
            }
          }
        }
        j++;
        String str = teks;
        teks = str.replaceRange(j, j, '(pow(');
        teks += ",";
        i++;
        if (inputText[i] == '(') {
          int b = 0;
          while (true) {
            if (inputText[i] == '(') {
              b--;
            } else if (inputText[i] == ')') {
              b++;
            }

            if (inputText[i] == '!') {
              teks = scanFactorial(teks);
              i++;
            } else if (inputText[i] == '^') {
              teks = scanPangkat(teks);
            } else {
              teks += inputText[i];
              i++;
            }

            if ((b == 0) && (i != inputText.length)) {
              if (inputText[i] == '!') {
                teks = scanFactorial(teks);
                i++;
              } else if (inputText[i] == '^') {
                teks = scanPangkat(teks);
              }
              break;
            } else if (b == 0) {
              break;
            }
          }
        } else {
          while (((inputText[i] == '^') ||
              ((inputText[i] != '*') &&
                      (inputText[i] != '/') &&
                      (inputText[i] != '+')) &&
                  (((inputText[i] != '-') ||
                      (((inputText.codeUnitAt(i + 1) > 47) &&
                              (inputText.codeUnitAt(i + 1) < 58)) &&
                          ((inputText.codeUnitAt(i - 1) < 48) ||
                              (inputText.codeUnitAt(i - 1) > 57))))))) {
            if (inputText[i] == '!') {
              teks = scanFactorial(teks);
              i++;
            } else if (inputText[i] == '^') {
              teks = scanPangkat(teks);
            } else {
              teks += inputText[i];
              i++;
            }
            if (i == inputText.length) {
              break;
            }
          }
        }
        teks += "))";
        return teks;
      }

      for (i = 0; i < jml; i++) {
        if (inputText[i] == String.fromCharCode(0x03c0)) {
          olahText += "p";
        } else if (inputText[i] == String.fromCharCode(0x21)) {
          olahText = scanFactorial(olahText);
        } else if (inputText[i] == '^') {
          olahText = scanPangkat(olahText);
          i--;
        } else {
          olahText += inputText[i];
        }
      }

      jml = olahText.length - 3;
      for (i = 0; i < jml; i++) {
        if ((olahText[i] == 'l') &&
            (olahText[i + 1] == 'o') &&
            (olahText[i + 2] == 'g')) {
          olahText = olahText.replaceRange(i, i, '(1/ln(10))*');
        }
      }
      Expression exp = Expression.parse(olahText);
      final evaluator = ExpressionEvaluator();
      var eval = evaluator.eval(exp, context);
      final text = eval.toStringAsFixed(akurasi);
      _controller.text = text;
      final textSelection = _controller.selection;
      _controller.selection = textSelection.copyWith(
        baseOffset: text.length,
        extentOffset: text.length,
      );
      check = true;
      if (riwayat.length < 21) {
        riwayat.add(inputText + "\n" + text);
      } else {
        riwayat.remove(riwayat[0]);
        riwayat.add(inputText + "\n" + text);
      }
      saveData();
    } catch (e) {
      final text = "Error";
      _controller.text = text;
      final textSelection = _controller.selection;
      _controller.selection = textSelection.copyWith(
        baseOffset: text.length,
        extentOffset: text.length,
      );
    }
  }

  void _clear() {
    final text = _controller.text;
    final textSelection = _controller.selection;
    final newText = text.replaceRange(
      //menghapus bagian dari text sesuai textselectionnya
      0,
      _controller.text.length,
      '',
    );
    _controller.text = newText; //memasukkan nilai dari proses diatas
    _controller.selection = textSelection.copyWith(
      //mengcopy posisi kursor pada teksfield
      baseOffset: 0,
      extentOffset: 0,
    );
  }

  void _insertText(String myText) {
    final textSelection = _controller.selection;
    _controller.text = _controller.text.replaceRange(
      //menambah teks sesuai posisi cursor
      textSelection.start,
      textSelection.end,
      myText,
    );
    final myTextLength = myText.length;
    _controller.selection = textSelection.copyWith(
      //mengcopy posisi kursor pada teksfield
      baseOffset: textSelection.start + myTextLength,
      extentOffset: textSelection.start + myTextLength,
    );
  }

  void _backspace() {
    final text = _controller.text; //memasukkan nilai teksfield ke variable text
    final textSelection = _controller
        .selection; //memasukkan posisi controller saat menghapus ke variable textSelection
    final selectionLength = textSelection.end -
        textSelection.start; //mencari lebar dari karakter yang akan dihapus

    // jika ada seleksi saat ingin menghapus atau menghapus secara banyak dalam sekali hapus.
    if (selectionLength > 0) {
      final newText = text.replaceRange(
        //menghapus bagian dari text sesuai textselectionnya
        textSelection.start,
        textSelection.end,
        '',
      );
      _controller.text = newText; //memasukkan nilai dari proses diatas
      _controller.selection = textSelection.copyWith(
        //mengcopy posisi kursor pada teksfield
        baseOffset: textSelection.start,
        extentOffset: textSelection.start,
      );
      return;
    }

    // menghapus saat isi teksfield kosong atau kursor berada di area terkiri.
    if (textSelection.start == 0) {
      return;
    }

    //untuk menghapus satu buah karakter tanpa selection cursor
    final previousCodeUnit = text.codeUnitAt(
        textSelection.start - 1); //memasukkan huruf terakhir pada variable text
    final offset = _isUtf16Surrogate(previousCodeUnit)
        ? 2
        : 1; //umumnya akan mereturn 1 karena posisi yang akan digunakan akan berkurang satu
    final newStart = textSelection.start -
        offset; //mengetahui posisi kursor saat dilakukan proses penghapusan
    final newEnd = textSelection.start;
    final newText = text.replaceRange(
      newStart,
      newEnd,
      '',
    );
    _controller.text = newText;
    _controller.selection = textSelection.copyWith(
      baseOffset: newStart,
      extentOffset: newStart,
    );
  }

  bool _isUtf16Surrogate(int value) {
    return value & 0xF800 == 0xD800;
  }

  @override
  void dispose() {
    //untuk menghapus data controller yang tidak digunakan lagi sehingga nilainya tidak akan memberatkan program
    _controller.dispose();
    super.dispose();
  }
}
