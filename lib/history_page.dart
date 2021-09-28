import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  final List<String> riwayat;
  HistoryPage(this.riwayat);
  List<Card> getRiwayat() {
    int z = riwayat.length;
    List<Card> kumpulanRiwayat = [];
    for (int i = z - 1; i > -1; i--) {
      kumpulanRiwayat.add(
        Card(
          borderOnForeground: true,
          shadowColor: Color(0xffaaaaaa),
          color: Color(0xffcccccc),
          elevation: 3,
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Text(
                '${z - i}. \n' + riwayat[i],
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      );
    }
    return kumpulanRiwayat;
  }

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
                "History",
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
          children: getRiwayat(),
        ),
      ),
    );
  }
}
