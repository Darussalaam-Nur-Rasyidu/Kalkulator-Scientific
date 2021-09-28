import 'package:flutter/foundation.dart';

class RiwayatTerakhir with ChangeNotifier {
  String _riwayat = "";
  String get riwayat => _riwayat;
  set riwayat(String value) {
    _riwayat = value;
    notifyListeners();
  }
}
