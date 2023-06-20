import 'package:flutter/material.dart';
import 'package:ticketing/bloc/product_bloc.dart';
import 'package:ticketing/model/produk.dart';
import 'package:ticketing/ui/book_ticket.dart';
import 'package:ticketing/ui/produk_form.dart';
import 'package:ticketing/ui/produk_page.dart';
import 'package:ticketing/ui/book_ticket.dart';
import 'package:ticketing/ui/edit_ticket_copy.dart';

class ProdukDetail extends StatefulWidget {
  Produk? produk;
  ProdukDetail({Key? key, this.produk}) : super(key: key);
  @override
  _ProdukDetailState createState() => _ProdukDetailState();
}

class _ProdukDetailState extends State<ProdukDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Nama : ${widget.produk!.namaPemesan}",
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              "Asal : ${widget.produk!.kotaAsal}",
              style: const TextStyle(fontSize: 18.0),
            ),
            Text(
              "Tujuan : ${widget.produk!.kotaTujuan}",
              style: const TextStyle(fontSize: 18.0),
            ),
            Text(
              "Dewasa : ${widget.produk!.dewasa.toString()}",
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              "Anak : ${widget.produk!.anak.toString()}",
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              "Balita : ${widget.produk!.balita.toString()}",
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              "Harga : Rp. ${widget.produk!.harga.toString()}",
              style: const TextStyle(fontSize: 18.0),
            ),
            _tombolHapusEdit()
          ],
        ),
      ),
    );
  }

  Widget _tombolHapusEdit() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        //Tombol Edit
        OutlinedButton(
            child: const Text("EDIT"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Edit_Ticket(
                            produk: widget.produk!,
                          )));
            }),
        //Tombol Hapus
        OutlinedButton(
            child: const Text("DELETE"), onPressed: () => confirmHapus()),
      ],
    );
  }

  void confirmHapus() {
    AlertDialog alertDialog = AlertDialog(
      content: const Text("Yakin ingin menghapus data ini?"),
      actions: [
        //tombol hapus
        OutlinedButton(
            child: const Text("Ya"),
            onPressed: () {
              ProdukBloc.deleteProduk(id: widget.produk?.id).then((value) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProdukPage()));
              });
            }),
        //tombol batal
        OutlinedButton(
          child: const Text("Batal"),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );

    showDialog(builder: (context) => alertDialog, context: context);
  }
}
