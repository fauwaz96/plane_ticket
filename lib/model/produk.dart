class Produk {
  int? id;
  String? kodeTicket;
  String? namaPemesan;
  String? alamat;
  String? kotaAsal;
  String? kotaTujuan;
  String? note;
  int? dewasa;
  int? anak;
  int? balita;
  int? harga;
  Produk({
    this.id,
    this.kodeTicket,
    this.namaPemesan,
    this.alamat,
    this.kotaAsal,
    this.kotaTujuan,
    this.note,
    this.dewasa,
    this.anak,
    this.balita,
    this.harga,
  });
  factory Produk.fromJson(Map<String, dynamic> obj) {
    return Produk(
        id: int.parse(obj['id']),
        kodeTicket: obj['kode_ticket'],
        namaPemesan: obj['nama_pemesan'],
        alamat: obj['alamat'],
        kotaAsal: obj['kota_asal'],
        kotaTujuan: obj['kota_tujuan'],
        note: obj['note'],
        dewasa: int.parse(obj['dewasa']),
        anak: int.parse(obj['anak']),
        balita: int.parse(obj['balita']),
        harga: int.parse(obj['harga']));
  }
}
