import 'package:flutter/material.dart';
import '../models/pemain.dart';

class DetailPemainPage extends StatelessWidget {
  final Pemain pemain;
  final int peringkat;

  const DetailPemainPage({
    super.key,
    required this.pemain,
    required this.peringkat,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pemain.nama)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Peringkat #$peringkat',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text('Skor ${pemain.skor}'),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _stat('Menang', pemain.menang, Colors.green),
                _stat('Kalah', pemain.kalah, Colors.red),
                _stat('Total', pemain.totalMain, Colors.blue),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _stat(String label, int nilai, Color warna) {
    return Column(
      children: [
        Text(
          '$nilai',
          style: TextStyle(
              fontSize: 32, fontWeight: FontWeight.bold, color: warna),
        ),
        Text(label),
      ],
    );
  }
}