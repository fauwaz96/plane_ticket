import 'dart:convert';

import 'package:ticketing/helpers/api.dart';
import 'package:ticketing/helpers/api_url.dart';
import 'package:ticketing/model/produk.dart';

class ProdukBloc {
  static Future<List<Produk>> getProduks() async {
    String apiUrl = ApiUrl.listProduk;
    var response = await Api().get(apiUrl);
    var jsonObj = json.decode(response.body);
    List<dynamic> listProduk = (jsonObj as Map<String, dynamic>)['data'];
    List<Produk> produks = [];
    for (int i = 0; i < listProduk.length; i++) {
      produks.add(Produk.fromJson(listProduk[i]));
    }
    return produks;
  }

  static Future addProduk({Produk? produk}) async {
    String apiUrl = ApiUrl.createProduk;

    var body = {
      "kode_ticket": produk!.kodeTicket,
      "nama_pemesan": produk.namaPemesan,
      "alamat": produk.alamat,
      "kota_asal": produk.kotaAsal,
      "kota_tujuan": produk.kotaTujuan,
      "note": produk.note,
      "dewasa": produk.dewasa.toString(),
      "anak": produk.anak.toString(),
      "balita": produk.balita.toString(),
      "harga": produk.harga.toString()
    };

    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return jsonObj['status'];
  }

  static Future<bool> updateProduk({required Produk produk}) async {
    String apiUrl = ApiUrl.updateProduk(produk.id!);

    var body = {
      "kode_ticket": produk.kodeTicket,
      "nama_pemesan": produk.namaPemesan,
      "alamat": produk.alamat,
      "kota_asal": produk.kotaAsal,
      "kota_tujuan": produk.kotaTujuan,
      "note": produk.note,
      "dewasa": produk.dewasa.toString(),
      "anak": produk.anak.toString(),
      "balita": produk.balita.toString(),
      "harga": produk.harga.toString()
    };
    print("Body : $body");
    var response = await Api().put(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return true;
  }

  static Future<bool> deleteProduk({int? id}) async {
    String apiUrl = ApiUrl.deleteProduk(id!);

    var response = await Api().delete(apiUrl);
    var jsonObj = json.decode(response.body);
    return jsonObj['code'] == 200;
  }
}
