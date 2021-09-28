import 'package:flutter/material.dart';

class TextClear extends StatelessWidget {
  const TextClear({
    Key key,
    this.backgroundColor,
    this.label,
    this.onTextInput,
    this.flex = 1,
  }) : super(key: key);

  final VoidCallback onTextInput;
  final int flex;
  final Color backgroundColor;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Material(
          color: Colors.red.shade900,
          child: InkWell(
            onTap: () {
              onTextInput
                  ?.call(); //melakukan input dari keyboard custom ke teksfield sesuai posisi kursor ataupun posisinya
            },
            child: Container(
              child: Center(
                child: Text(label,
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
