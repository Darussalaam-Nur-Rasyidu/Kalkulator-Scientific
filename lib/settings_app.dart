import 'package:calcullator_scientific/button/increment_decrement.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Text(
                "Settings",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          automaticallyImplyLeading: false,
        ),
        body: ListView(
          children: [
            Card(
              color: Color(0xffeeeeee),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Ketelitian",
                    style: TextStyle(fontSize: 18),
                  ),
                  IncDec(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
