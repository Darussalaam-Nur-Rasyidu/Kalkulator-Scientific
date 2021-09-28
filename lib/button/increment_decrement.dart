import 'package:calcullator_scientific/Provider/ketelitian_hitung.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IncDec extends StatelessWidget {
  void saveData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt("akurasi", akurasi);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Ketelitian>(
      create: (BuildContext context) => new Ketelitian(),
      child: Container(
        height: 55,
        width: 80,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Colors.black,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 51,
              height: 51,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: Colors.black, width: 2),
                ),
              ),
              child: Consumer<Ketelitian>(
                builder: (context, ketelitian, _) => Center(
                  child: Text(
                    ketelitian.ketelitian.toString(),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            Consumer<Ketelitian>(
              builder: (context, ketelitian, _) => Column(
                children: [
                  CreateButton(
                    incdect: () {
                      if (ketelitian.ketelitian < 20) {
                        ketelitian.ketelitian++;
                        akurasi = ketelitian.ketelitian;
                        saveData();
                      }
                    },
                    icon: Icon(
                      Icons.arrow_drop_up,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  CreateButton(
                    incdect: () {
                      if (ketelitian.ketelitian > 0) {
                        ketelitian.ketelitian--;
                        akurasi = ketelitian.ketelitian;
                        saveData();
                      }
                    },
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreateButton extends StatelessWidget {
  final Function incdect;
  final Icon icon;
  CreateButton({this.incdect, this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      width: 24,
      child: Material(
        elevation: 2,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffaaaaaa),
                Color(0xffcccccc),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.amber,
              onTap: incdect,
              child: Center(
                child: icon,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
