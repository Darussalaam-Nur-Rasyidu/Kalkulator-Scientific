import 'package:calcullator_scientific/Provider/new_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextKey extends StatelessWidget {
  const TextKey({
    Key key,
    @required this.text,
    this.label2 = "",
    this.backgroundColor = Colors.black26,
    this.labelColor = Colors.black,
    this.label,
    this.onTextInput,
    this.flex = 1,
    this.idx = -1,
  }) : super(key: key);

  final String text, label2;
  final ValueSetter<String> onTextInput;
  final int flex, idx;
  final Color backgroundColor, labelColor;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Material(
          color: backgroundColor,
          child: Consumer<NewButton>(
            builder: (context, newButton, _) => InkWell(
              onTap: () {
                onTextInput?.call(text);
                //melakukan input dari keyboard custom ke teksfield sesuai posisi kursor ataupun posisinya
              },
              onLongPress: () {
                if (idx != -1) {
                  newButton.idx = idx;
                  newButton.isDibuat = true;
                  newButton.newButton = newButton.getNewButton();
                }
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
                    Align(
                      alignment: Alignment(0.88, 0.88),
                      child: Text(
                        label2,
                        style: TextStyle(
                          fontSize: 12,
                          color: labelColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
