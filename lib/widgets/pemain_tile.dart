import 'package:flutter/material.dart';
import '../models/pemain.dart';
import '../views/detail_pemain_page.dart';

class PemainTile extends StatelessWidget {
  final Pemain pemain;
  final int peringkat;

  const PemainTile({super.key, required this.pemain, required this.peringkat});

  Color? get _warnaMedali {
    switch (peringkat) {
      case 1:
        return const Color(0xFFFFC107); // emas
      case 2:
        return const Color(0xFF9E9E9E); // perak
      case 3:
        return const Color(0xFFCD7F32); // perunggu
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final medali = _warnaMedali;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: medali != null ? 4 : 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: medali != null
            ? BorderSide(color: medali, width: 2)
            : BorderSide.none,
      ),
      child: ListTile(
        leading: medali != null
            ? Icon(Icons.emoji_events, color: medali, size: 36)
            : CircleAvatar(child: Text('$peringkat')),
        title: Text(
          pemain.nama,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('Skor: ${pemain.skor}'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
                DetailPemainPage(pemain: pemain, peringkat: peringkat),
          ),
        ),
      ),
    );
  }
}