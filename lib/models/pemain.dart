class Pemain {
  final int id;
  final String nama;
  final int skor;
  final int menang;
  final int kalah;

  Pemain({
    required this.id,
    required this.nama,
    required this.skor,
    required this.menang,
    required this.kalah,
  });

  factory Pemain.fromJson(Map<String, dynamic> json) {
    return Pemain(
      id: json['id'] as int,
      nama: json['nama'] as String,
      skor: json['skor'] as int,
      menang: json['menang'] as int,
      kalah: json['kalah'] as int,
    );
  }

  int get totalMain => menang + kalah;
}