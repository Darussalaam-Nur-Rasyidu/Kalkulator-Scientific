import 'package:calcullator_scientific/Provider/new_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'text_key.dart';
import 'backspace_key.dart';
import 'text_clear.dart';

class CustomKeyboard extends StatefulWidget {
  CustomKeyboard({
    Key key,
    this.onTextInput,
    this.onBackspace,
    this.onClear,
    this.onOK,
  }) : super(key: key);

  final ValueSetter<String> onTextInput;
  final VoidCallback onBackspace;
  final VoidCallback onClear;
  final VoidCallback onOK;

  @override
  _CustomKeyboardState createState() =>
      _CustomKeyboardState(onTextInput, onBackspace, onClear, onOK);
}

class _CustomKeyboardState extends State<CustomKeyboard> {
  _CustomKeyboardState(
    this.onTextInput,
    this.onBackspace,
    this.onClear,
    this.onOK,
  );
  ValueSetter<String> onTextInput;
  VoidCallback onBackspace;
  VoidCallback onClear;
  VoidCallback onOK;
  bool ganti = true;

  void _textInputHandler(String text) => onTextInput
      ?.call(text); //fungsi yang mereturn teks yang diinputkan dari keyboard

  void _textClear() => onClear?.call();

  void _onResult() => onOK?.call();

  void _backspaceHandler() => onBackspace
      ?.call(); //fungsi yang mereturn tindakan penghapusan yang dilakukan

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NewButton>(
      create: (BuildContext context) => new NewButton(onTextInput: onTextInput),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        color: Colors.grey,
        child: Stack(
          children: [
            Column(
              children: [
                buildRowOne(),
                buildRowTwo(),
                buildRowThree(),
                buildRowFour(),
                buildRowFive(),
              ],
            ),
            Consumer<NewButton>(
              builder: (context, newButton, _) => newButton.newButton,
            ),
          ],
        ),
      ),
    );
  }

  Expanded buildRowOne() {
    return Expanded(
      child: Row(
        children: [
          TextClear(
            label: 'AC',
            flex: 1,
            onTextInput: _textClear,
          ),
          TextKey(
            text: 'x',
            label: 'x',
            label2: 'y',
            idx: 0,
            backgroundColor: Colors.blue.shade900,
            labelColor: Colors.white,
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: String.fromCharCode(0x21),
            label: 'n!',
            label2: '|x|',
            idx: 1,
            backgroundColor: Color(0x8a000000),
            labelColor: Colors.white,
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '^',
            label: '^',
            label2: '%',
            idx: 2,
            backgroundColor: Color(0x8a000000),
            labelColor: Colors.white,
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'sqrt(',
            label: '√',
            backgroundColor: Color(0x8a000000),
            labelColor: Colors.white,
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '(',
            label: '(',
            backgroundColor: Colors.green.shade900,
            labelColor: Colors.white,
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: ')',
            label: ')',
            backgroundColor: Colors.green.shade900,
            labelColor: Colors.white,
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }

  Expanded buildRowTwo() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: 'sin(',
            label: 'sin',
            label2: 'arcsin',
            idx: 3,
            backgroundColor: Colors.blue.shade900,
            labelColor: Colors.white,
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'nPr(',
            label: 'nPr',
            label2: 'nCr',
            idx: 4,
            backgroundColor: Colors.blue.shade900,
            labelColor: Colors.white,
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '7',
            label: '7',
            label2: 'abc',
            idx: 5,
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '8',
            label: '8',
            label2: 'def',
            idx: 6,
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '9',
            label: '9',
            label2: 'ghi',
            idx: 7,
            onTextInput: _textInputHandler,
          ),
          BackspaceKey(
            icon: Icon(Icons.backspace, color: Colors.white),
            flex: 2,
            onBackspace:
                _backspaceHandler, //menghapus isi teksfield dengan keyboard custom
          ),
        ],
      ),
    );
  }

  Expanded buildRowThree() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: 'cos(',
            label: 'cos',
            label2: 'arccos',
            idx: 8,
            backgroundColor: Colors.blue.shade900,
            labelColor: Colors.white,
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: String.fromCharCode(0x03c0),
            label: 'π',
            label2: 'e',
            idx: 9,
            backgroundColor: Colors.blue.shade900,
            labelColor: Colors.white,
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '4',
            label: '4',
            label2: 'jkl',
            idx: 10,
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '5',
            label: '5',
            label2: 'mno',
            idx: 11,
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '6',
            label: '6',
            label2: 'pqr',
            idx: 12,
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '*',
            label: '×',
            backgroundColor: Color(0x8a000000),
            labelColor: Colors.white,
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '/',
            label: '÷',
            backgroundColor: Color(0x8a000000),
            labelColor: Colors.white,
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }

  Expanded buildRowFour() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: 'tan(',
            label: 'tan',
            label2: 'arctan',
            idx: 13,
            backgroundColor: Colors.blue.shade900,
            labelColor: Colors.white,
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'log(',
            label: 'log',
            label2: 'ln',
            idx: 14,
            backgroundColor: Colors.blue.shade900,
            labelColor: Colors.white,
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '1',
            label: '1',
            label2: 'stu',
            idx: 15,
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '2',
            label: '2',
            label2: 'vwx',
            idx: 16,
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '3',
            label: '3',
            label2: 'yz',
            idx: 17,
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '+',
            label: '+',
            backgroundColor: Color(0x8a000000),
            labelColor: Colors.white,
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '-',
            label: '-',
            backgroundColor: Color(0x8a000000),
            labelColor: Colors.white,
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }

  Expanded buildRowFive() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: ' ',
            label: 'spasi',
            onTextInput: _textInputHandler,
            flex: 2,
          ),
          TextKey(
            text: '0',
            label: '0',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '00',
            label: '00',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '.',
            label: '.',
            label2: ',',
            idx: 18,
            onTextInput: _textInputHandler,
          ),
          TextClear(
            label: '=',
            onTextInput: _onResult,
            flex: 2,
          ),
        ],
      ),
    );
  }
}
