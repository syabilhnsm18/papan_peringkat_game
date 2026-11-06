import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../models/pemain.dart';

class PemainController extends ChangeNotifier {
  List<Pemain> _daftarPemain = [];
  bool _isLoading = true;
  String? _error;

  List<Pemain> get daftarPemain => _daftarPemain;
  bool get isLoading => _isLoading;
  String? get error => _error;

  /// Membaca pemain.json lalu mengurutkan dari skor tertinggi.
  Future<void> muatData() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final raw = await rootBundle.loadString('assets/data/pemain.json');
      final List<dynamic> data = jsonDecode(raw);
      _daftarPemain = data.map((e) => Pemain.fromJson(e)).toList();
      urutkanPemain();
    } catch (e) {
      _error = 'Gagal memuat data: $e';
    }

    _isLoading = false;
    notifyListeners();
  }

  /// Urutkan skor tertinggi -> terendah.
  /// Jika skor sama, yang menangnya lebih banyak di atas.
  void urutkanPemain() {
    _daftarPemain.sort((a, b) {
      final cmp = b.skor.compareTo(a.skor);
      return cmp != 0 ? cmp : b.menang.compareTo(a.menang);
    });
  }
}