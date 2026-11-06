import 'package:flutter/material.dart';
import '../controllers/pemain_controller.dart';
import '../widgets/pemain_tile.dart';

class PapanPeringkatPage extends StatefulWidget {
  const PapanPeringkatPage({super.key});

  @override
  State<PapanPeringkatPage> createState() => _PapanPeringkatPageState();
}

class _PapanPeringkatPageState extends State<PapanPeringkatPage> {
  final PemainController _controller = PemainController();

  @override
  void initState() {
    super.initState();
    _controller.muatData();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Papan Peringkat Game')),
      body: ListenableBuilder(
        listenable: _controller,
        builder: (context, _) {
          if (_controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (_controller.error != null) {
            return Center(child: Text(_controller.error!));
          }
          final data = _controller.daftarPemain;
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: data.length,
            itemBuilder: (context, i) =>
                PemainTile(pemain: data[i], peringkat: i + 1),
          );
        },
      ),
    );
  }
}