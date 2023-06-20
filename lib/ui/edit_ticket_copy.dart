import 'package:flutter/material.dart';
import 'package:ticketing/bloc/product_bloc.dart';
import 'package:ticketing/model/produk.dart';
import 'package:ticketing/ui/produk_form.dart';
import 'package:ticketing/ui/produk_page.dart';
import 'package:slider_button/slider_button.dart';

class Edit_Ticket extends StatefulWidget {
  Produk? produk;
  Edit_Ticket({Key? key, this.produk}) : super(key: key);
  @override
  _Edit_TicketState createState() => _Edit_TicketState();
}

class _Edit_TicketState extends State<Edit_Ticket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        width: 400,
        child: Column(
          children: [
            _tombolHapusEdit(),
            Text(
              "Kode Ticket: ${widget.produk!.kodeTicket}",
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              "Nama Pemesan: ${widget.produk!.namaPemesan}",
              style: const TextStyle(fontSize: 18.0),
            ),
            Text(
              "Alamat : ${widget.produk!.alamat}",
              style: const TextStyle(fontSize: 18.0),
            ),
            Text(
              "Kota Asal : ${widget.produk!.kotaAsal}",
              style: const TextStyle(fontSize: 18.0),
            ),
            Text(
              "Kota Tujuan : ${widget.produk!.kotaTujuan}",
              style: const TextStyle(fontSize: 18.0),
            ),
            Text(
              "Note : ${widget.produk!.note}",
              style: const TextStyle(fontSize: 18.0),
            ),
            Text(
              "Dewasa : ${widget.produk!.dewasa.toString()}",
              style: const TextStyle(fontSize: 18.0),
            ),
            Text(
              "Anak : ${widget.produk!.anak.toString()}",
              style: const TextStyle(fontSize: 18.0),
            ),
            Text(
              "Balita : ${widget.produk!.balita.toString()}",
              style: const TextStyle(fontSize: 18.0),
            ),
            Text(
              "Harga : Rp. ${widget.produk!.harga.toString()}",
              style: const TextStyle(fontSize: 18.0),
            ),
            _space(),
            _delete()
          ],
        ),
      ),
    );
  }

  Widget _tombolHapusEdit() {
    return Row(
      // mainAxisSize: MainAxisSize.min,
      // crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        //Tombol Edit
        OutlinedButton(
            child: const Text("EDIT"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProdukForm(
                            produk: widget.produk!,
                          )));
            }),
        //Tombol Hapus
        // OutlinedButton(
        //     child: const Text("DELETE"), onPressed: () => confirmHapus()),
      ],
    );
  }

  Widget _delete() {
    return SliderButton(
      action: () {
        ProdukBloc.deleteProduk(id: widget.produk?.id).then((value) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const ProdukPage()));
        });
      },
      // baseColor: Colors.red,
      buttonColor: Colors.red,
      icon: Icon(Icons.delete, size: 35),
      label: Text(
        "Delete Item",
        style: TextStyle(
          color: Colors.orangeAccent,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _space() {
    return SizedBox(
      height: 80,
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
