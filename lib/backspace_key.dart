import 'package:flutter/material.dart';

class BackspaceKey extends StatelessWidget {
  const BackspaceKey({
    Key key,
    this.onBackspace,
    this.icon,
    this.flex = 1,
  }) : super(key: key);

  final VoidCallback onBackspace;
  final Icon icon;
  final int flex;

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
              onBackspace
                  ?.call(); //menghapus teks yang dipilih berdasarkan posisi kursor atau seleksinya
            },
            child: Container(
              child: Center(
                child: icon, //hapus
              ),
            ),
          ),
        ),
      ),
    );
  }
}
