import 'package:flutter/material.dart';
import 'package:ticketing/bloc/product_bloc.dart';
import 'package:ticketing/model/produk.dart';
import 'package:ticketing/ui/produk_page.dart';
import 'package:ticketing/widget/warning_dialog.dart';

class ProdukForm extends StatefulWidget {
  Produk? produk;
  ProdukForm({Key? key, this.produk}) : super(key: key);

  @override
  _ProdukFormState createState() => _ProdukFormState();
}

class _ProdukFormState extends State<ProdukForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  late String judul;
  late String tombolSubmit;

  final _kodeTicketTextboxController = TextEditingController();
  final _namaPemesanTextboxController = TextEditingController();
  final _alamatTextboxController = TextEditingController();
  final _kotaAsalTextboxController = TextEditingController();
  final _kotaTujuanTextboxController = TextEditingController();
  final _noteTextboxController = TextEditingController();
  final _dewasaTextboxController = TextEditingController();
  final _anakTextboxController = TextEditingController();
  final _balitaTextboxController = TextEditingController();
  final _hargaTextboxController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isUpdate();
  }

  isUpdate() {
    if (widget.produk != null) {
      setState(() {
        judul = "UBAH PRODUK";
        tombolSubmit = "UBAH";
        _kodeTicketTextboxController.text = widget.produk!.kodeTicket!;
        _namaPemesanTextboxController.text = widget.produk!.namaPemesan!;
        _alamatTextboxController.text = widget.produk!.alamat!;
        _kotaAsalTextboxController.text = widget.produk!.kotaAsal!;
        _kotaTujuanTextboxController.text = widget.produk!.kotaTujuan!;
        _noteTextboxController.text = widget.produk!.note!;
        _dewasaTextboxController.text = widget.produk!.dewasa.toString();
        _anakTextboxController.text = widget.produk!.anak.toString();
        _balitaTextboxController.text = widget.produk!.balita.toString();
        _hargaTextboxController.text = widget.produk!.harga.toString();
        // _dewasaTextboxController.text =
        //     widget.produk!.dewasa.toString();
      });
    } else {
      judul = "TAMBAH PRODUK";
      tombolSubmit = "SIMPAN";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(judul), backgroundColor: Colors.orangeAccent),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _kodeTicketTextField(),
                _namaPemesanTextField(),
                _alamatTextField(),
                _kotaAsalTextField(),
                _kotaTujuanTextField(),
                _noteTextField(),
                _dewasaTextField(),
                _anakTextField(),
                _balitaTextField(),
                _hargaTextField(),
                _buttonSubmit()
              ],
            ),
          ),
        ),
      ),
    );
  }

//Membuat Kode Ticket
  Widget _kodeTicketTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Kode Ticket"),
      keyboardType: TextInputType.text,
      controller: _kodeTicketTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Kode Ricket harus diisi";
        }
        return null;
      },
    );
  }

  //Membuat Textbox Nama Pemesan
  Widget _namaPemesanTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Nama Pemesan"),
      keyboardType: TextInputType.text,
      controller: _namaPemesanTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Nama Pemesan harus diisi";
        }
        return null;
      },
    );
  }

  //Membuat Textbox Alamat
  Widget _alamatTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Alamat"),
      keyboardType: TextInputType.text,
      controller: _alamatTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Alamat harus diisi";
        }
        return null;
      },
    );
  }

  //Membuat Textbox Kota Asal
  Widget _kotaAsalTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Kota Asal"),
      keyboardType: TextInputType.text,
      controller: _kotaAsalTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Kota Asal harus diisi";
        }
        return null;
      },
    );
  }

  //Membuat Textbox Kota Tujuan
  Widget _kotaTujuanTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Kota Tujuan"),
      keyboardType: TextInputType.text,
      controller: _kotaTujuanTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Kota Tujuan harus diisi";
        }
        return null;
      },
    );
  }

  //Membuat Textbox Note
  Widget _noteTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Note"),
      keyboardType: TextInputType.text,
      controller: _noteTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Note harus diisi";
        }
        return null;
      },
    );
  }

  //Membuat Textbox Dewasa
  Widget _dewasaTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Dewasa"),
      keyboardType: TextInputType.number,
      controller: _dewasaTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "jumlah dewasa harus diisi";
        }
        return null;
      },
    );
  }

  Widget _anakTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Anak"),
      keyboardType: TextInputType.number,
      controller: _anakTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "jumlah anak harus diisi";
        }
        return null;
      },
    );
  }

  Widget _balitaTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Balita"),
      keyboardType: TextInputType.number,
      controller: _balitaTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "jumlah balita harus diisi";
        }
        return null;
      },
    );
  }

  Widget _hargaTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Harga"),
      keyboardType: TextInputType.number,
      controller: _hargaTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Harga harus diisi";
        }
        return null;
      },
    );
  }

  //Membuat Tombol Simpan/Ubah
  Widget _buttonSubmit() {
    return OutlinedButton(
        child: Text(tombolSubmit),
        onPressed: () {
          var validate = _formKey.currentState!.validate();
          if (validate) {
            if (!_isLoading) {
              if (widget.produk != null) {
                //kondisi update produk
                ubah();
              }
            }
          }
        });
  }

  ubah() {
    setState(() {
      _isLoading = true;
    });
    Produk updateProduk = Produk(id: null);
    updateProduk.kodeTicket = _kodeTicketTextboxController.text;
    updateProduk.namaPemesan = _namaPemesanTextboxController.text;
    updateProduk.alamat = _alamatTextboxController.text;
    updateProduk.kotaAsal = _kotaAsalTextboxController.text;
    updateProduk.kotaTujuan = _kotaTujuanTextboxController.text;
    updateProduk.note = _noteTextboxController.text;
    updateProduk.dewasa = int.parse(_dewasaTextboxController.text);
    updateProduk.anak = int.parse(_anakTextboxController.text);
    updateProduk.balita = int.parse(_balitaTextboxController.text);
    updateProduk.harga = int.parse(_hargaTextboxController.text);
    ProdukBloc.updateProduk(produk: updateProduk).then((value) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const ProdukPage()));
    }, onError: (error) {
      showDialog(
          context: context,
          builder: (BuildContext context) => const WarningDialog(
                description: "Permintaan ubah data gagal, silahkan coba lagi",
              ));
    });
    setState(() {
      _isLoading = false;
    });
  }
}
