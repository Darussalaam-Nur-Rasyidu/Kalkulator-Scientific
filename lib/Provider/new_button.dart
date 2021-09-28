import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NewButton with ChangeNotifier {
  final ValueSetter<String> onTextInput;
  NewButton({this.onTextInput});
  void _textInputHandler(String text) => onTextInput?.call(text);

  int idx = 0;

  bool isDibuat = true;

  Widget _newButton = Container();
  Widget get newButton => _newButton;
  set newButton(Widget widget) {
    _newButton = widget;
    notifyListeners();
  }

  Widget getNewButton() {
    List<List<Widget>> _newButtonList = [
      [
        NewButtonModel(
          text: 'y',
          label: 'y',
          onTextInput: _textInputHandler,
        ),
        NewButtonModel(
          text: 'z',
          label: 'z',
          onTextInput: _textInputHandler,
        ),
      ],
      [
        NewButtonModel(
          text: 'aBs(',
          label: '|x|',
          onTextInput: _textInputHandler,
        )
      ],
      [
        NewButtonModel(
          text: '%',
          label: '%',
          onTextInput: _textInputHandler,
        )
      ],
      [
        NewButtonModel(
          text: 'arcsin(',
          label: 'arcsin',
          onTextInput: _textInputHandler,
        )
      ],
      [
        NewButtonModel(
          text: 'nCr(',
          label: 'nCr',
          onTextInput: _textInputHandler,
        )
      ],
      [
        NewButtonModel(
          text: 'a',
          label: 'a',
          onTextInput: _textInputHandler,
        ),
        NewButtonModel(
          text: 'b',
          label: 'b',
          onTextInput: _textInputHandler,
        ),
        NewButtonModel(
          text: 'c',
          label: 'c',
          onTextInput: _textInputHandler,
        ),
      ],
      [
        NewButtonModel(
          text: 'd',
          label: 'd',
          onTextInput: _textInputHandler,
        ),
        NewButtonModel(
          text: 'e',
          label: 'e',
          onTextInput: _textInputHandler,
        ),
        NewButtonModel(
          text: 'f',
          label: 'f',
          onTextInput: _textInputHandler,
        ),
      ],
      [
        NewButtonModel(
          text: 'g',
          label: 'g',
          onTextInput: _textInputHandler,
        ),
        NewButtonModel(
          text: 'h',
          label: 'h',
          onTextInput: _textInputHandler,
        ),
        NewButtonModel(
          text: 'i',
          label: 'i',
          onTextInput: _textInputHandler,
        ),
      ],
      [
        NewButtonModel(
          text: 'arccos(',
          label: 'arccos',
          onTextInput: _textInputHandler,
        ),
      ],
      [
        NewButtonModel(
          text: 'e',
          label: 'e',
          onTextInput: _textInputHandler,
        ),
      ],
      [
        NewButtonModel(
          text: 'j',
          label: 'j',
          onTextInput: _textInputHandler,
        ),
        NewButtonModel(
          text: 'k',
          label: 'k',
          onTextInput: _textInputHandler,
        ),
        NewButtonModel(
          text: 'l',
          label: 'l',
          onTextInput: _textInputHandler,
        ),
      ],
      [
        NewButtonModel(
          text: 'm',
          label: 'm',
          onTextInput: _textInputHandler,
        ),
        NewButtonModel(
          text: 'n',
          label: 'n',
          onTextInput: _textInputHandler,
        ),
        NewButtonModel(
          text: 'o',
          label: 'o',
          onTextInput: _textInputHandler,
        ),
      ],
      [
        NewButtonModel(
          text: 'p',
          label: 'p',
          onTextInput: _textInputHandler,
        ),
        NewButtonModel(
          text: 'q',
          label: 'q',
          onTextInput: _textInputHandler,
        ),
        NewButtonModel(
          text: 'r',
          label: 'r',
          onTextInput: _textInputHandler,
        ),
      ],
      [
        NewButtonModel(
          text: 'arctan(',
          label: 'arctan',
          onTextInput: _textInputHandler,
        ),
      ],
      [
        NewButtonModel(
          text: 'ln(',
          label: 'ln',
          onTextInput: _textInputHandler,
        ),
      ],
      [
        NewButtonModel(
          text: 's',
          label: 's',
          onTextInput: _textInputHandler,
        ),
        NewButtonModel(
          text: 't',
          label: 't',
          onTextInput: _textInputHandler,
        ),
        NewButtonModel(
          text: 'u',
          label: 'u',
          onTextInput: _textInputHandler,
        ),
      ],
      [
        NewButtonModel(
          text: 'v',
          label: 'v',
          onTextInput: _textInputHandler,
        ),
        NewButtonModel(
          text: 'w',
          label: 'w',
          onTextInput: _textInputHandler,
        ),
        NewButtonModel(
          text: 'x',
          label: 'x',
          onTextInput: _textInputHandler,
        ),
      ],
      [
        NewButtonModel(
          text: 'y',
          label: 'y',
          onTextInput: _textInputHandler,
        ),
        NewButtonModel(
          text: 'z',
          label: 'z',
          onTextInput: _textInputHandler,
        ),
      ],
      [
        NewButtonModel(
          text: ',',
          label: ',',
          onTextInput: _textInputHandler,
        )
      ],
    ];
    List<Alignment> alignment = [
      Alignment(-1.7 / 3.5, -1.7 / 2.5), //y
      Alignment(-0.7 / 3.5, -1.7 / 2.5), //|x|
      Alignment(0.3 / 3.5, -1.7 / 2.5), //%
      Alignment(-2.7 / 3.5, -0.7 / 2.5), //arcsin
      Alignment(-1.7 / 3.5, -0.7 / 2.5), //nCr
      Alignment(-0.7 / 3.5, -0.7 / 2.5), //abc
      Alignment(0.3 / 3.5, -0.7 / 2.5), //def
      Alignment(0.7 / 3.5, -0.7 / 2.5), //ghi
      Alignment(-2.7 / 3.5, -0.3 / 2.5), //arccos
      Alignment(-1.7 / 3.5, -0.3 / 2.5), //e
      Alignment(-0.7 / 3.5, -0.3 / 2.5), //jkl
      Alignment(0.3 / 3.5, -0.3 / 2.5), //mno
      Alignment(0.7 / 3.5, -0.3 / 2.5), //pqr
      Alignment(-2.7 / 3.5, 0.7 / 2.5), //arctan
      Alignment(-1.7 / 3.5, 0.7 / 2.5), //ln
      Alignment(-0.7 / 3.5, 0.7 / 2.5), //stu
      Alignment(0.3 / 3.5, 0.7 / 2.5), //vwx
      Alignment(0.7 / 3.5, 0.7 / 2.5), //yz
      Alignment(3 / 7, 3 / 5),
    ];
    return (isDibuat)
        ? Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black.withOpacity(0.7),
            child: InkWell(
              onTap: () {
                isDibuat = false;
                newButton = getNewButton();
              },
              child: Align(
                alignment: alignment[idx],
                child: Container(
                  padding: EdgeInsets.all(2),
                  color: Color(0xff333333),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: (_newButtonList[idx]),
                  ),
                ),
              ),
            ),
          )
        : Container();
  }

  notifyListeners();
}

class NewButtonModel extends StatelessWidget {
  final ValueSetter<String> onTextInput;
  final String text;
  final String label;
  NewButtonModel({this.onTextInput, this.text, this.label});
  void _textInputHandler(String text) => onTextInput?.call(text);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.13,
      child: NewKey(
        text: text,
        label: label,
        backgroundColor: Colors.black,
        labelColor: Colors.white,
        onTextInput: _textInputHandler,
      ),
    );
  }
}

class NewKey extends StatelessWidget {
  const NewKey({
    Key key,
    @required this.text,
    this.backgroundColor = Colors.black26,
    this.labelColor = Colors.black,
    this.label,
    this.onTextInput,
    this.idx = -1,
  }) : super(key: key);

  final String text;
  final ValueSetter<String> onTextInput;
  final int idx;
  final Color backgroundColor, labelColor;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Material(
        color: backgroundColor,
        child: InkWell(
          onTap: () {
            onTextInput?.call(text);
            //melakukan input dari keyboard custom ke teksfield sesuai posisi kursor ataupun posisinya
          },
          child: Container(
            child: Stack(
              children: [
                Center(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: 20,
                      color: labelColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
