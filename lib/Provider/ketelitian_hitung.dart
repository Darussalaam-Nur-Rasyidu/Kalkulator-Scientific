import 'package:flutter/foundation.dart';

int akurasi = 2;

class Ketelitian with ChangeNotifier {
  int _ketelitian = akurasi;
  int get ketelitian => _ketelitian;
  set ketelitian(int value) {
    _ketelitian = value;
    notifyListeners();
  }
}
