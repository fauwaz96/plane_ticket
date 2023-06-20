import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ticketing/bloc/product_bloc.dart';
import 'package:ticketing/model/produk.dart';
import 'package:ticketing/widget/warning_dialog.dart';
import 'package:ticketing/ui/produk_page.dart';
import 'package:ticketing/ui/main_menu2.dart';

class Book_Ticket extends StatefulWidget {
  Produk? produk;
  Book_Ticket({Key? key, this.produk}) : super(key: key);

  @override
  _Book_TicketState createState() => _Book_TicketState();
}

class _Book_TicketState extends State<Book_Ticket> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  // final _kodeProdukTextboxController = TextEditingController();
  final _kotaAsalTextboxController = TextEditingController();
  final _kotaTujuanTextboxController = TextEditingController();
  final _namaPemesanTextboxController = TextEditingController();
  final _alamatTextboxController = TextEditingController();
  final _noteTextboxController = TextEditingController();
  final _dewasaTextboxController = TextEditingController();
  final _anakTextboxController = TextEditingController();
  final _balitaTextboxController = TextEditingController();
  String? dropdownTujuan;
  String? dropdownAsal;
  // final List<String> keberangkatan = [
  //   'Malang',
  //   'Surabaya',
  //   'Solo',
  //   'Jogjakarta',
  //   'Semarang',
  // ];

  // final List<String> tujuan = [
  //   'Malang',
  //   'Surabaya',
  //   'Solo',
  //   'Jogjakarta',
  //   'Semarang',
  // ];

  String? selectedKeberangkatan;
  String? selectedTujuan;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Container(
            color: Colors.white,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 190,
                        width: 490,
                        child: Image.network(
                          'https://images.unsplash.com/photo-1566566220367-af8d77269124?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=80 500w,',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15, left: 10),
                        child: Text(
                          "Air Bus✈️",
                          style: TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.italic,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 9),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 150,
                        // decoration: BoxDecoration(
                        //     color: Colors.green.shade50,
                        //     border: Border.all(
                        //         width: 2, color: Colors.greenAccent.shade400),
                        //     borderRadius: BorderRadius.circular(25)),
                        child: DropdownButtonFormField2<String>(
                          value: dropdownAsal,
                          buttonDecoration: BoxDecoration(
                              color: Color.fromARGB(255, 124, 241, 150),
                              borderRadius: BorderRadius.circular(15)),
                          decoration: InputDecoration(
                            //Add isDense true and zero Padding.
                            //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),

                            //Add more decoration as you want here
                            //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                          ),
                          isExpanded: true,
                          hint: const Text(
                            'From',
                            style: TextStyle(fontSize: 25),
                          ),
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black45,
                          ),
                          iconSize: 30,
                          buttonHeight: 60,
                          buttonPadding:
                              const EdgeInsets.only(left: 20, right: 10),
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          items: <String>[
                            'Malang',
                            'Surabaya',
                            'Solo',
                            'Jogjakarta',
                            'Semarang',
                          ]
                              .map<DropdownMenuItem<String>>(
                                  (String asal) => DropdownMenuItem<String>(
                                        value: asal,
                                        child: Text(
                                          asal,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                              .toList(),
                          validator: (asal) {
                            if (asal == null) {
                              return 'Isikan Asal.';
                            }
                          },
                          onChanged: (String? newAsal) {
                            setState(() {
                              dropdownAsal = newAsal!;
                            });
                            //Do something when changing the item if you want.
                          },
                          // onSaved: (value) {
                          //   selectedTujuan = value.toString();
                          // },
                        ),
                      ),
                      Container(
                        child: Image.asset(
                          'images/panah.png',
                          height: 50,
                          width: 50,
                        ),
                      ),
                      Container(
                        width: 150,
                        // decoration: BoxDecoration(
                        //     color: Colors.red.shade50,
                        //     border: Border.all(
                        //         width: 2, color: Colors.redAccent.shade400),
                        //     borderRadius: BorderRadius.circular(25)),
                        child: DropdownButtonFormField2<String>(
                          value: dropdownTujuan,
                          buttonDecoration: BoxDecoration(
                              color: Color.fromARGB(255, 245, 134, 158),
                              borderRadius: BorderRadius.circular(15)),
                          decoration: InputDecoration(
                            //Add isDense true and zero Padding.
                            //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),

                            //Add more decoration as you want here
                            //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                          ),
                          isExpanded: true,
                          hint: const Text(
                            'To',
                            style: TextStyle(fontSize: 25),
                          ),
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black45,
                          ),
                          iconSize: 30,
                          buttonHeight: 60,
                          buttonPadding:
                              const EdgeInsets.only(left: 20, right: 10),
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          items: <String>[
                            'Malang',
                            'Surabaya',
                            'Solo',
                            'Jogjakarta',
                            'Semarang',
                          ]
                              .map<DropdownMenuItem<String>>(
                                  (String tujuan) => DropdownMenuItem<String>(
                                        value: tujuan,
                                        child: Text(
                                          tujuan,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                              .toList(),
                          validator: (tujuan) {
                            if (tujuan == null) {
                              return 'Isikan Tujuan.';
                            }
                          },
                          onChanged: (String? newTujuan) {
                            setState(() {
                              dropdownTujuan = newTujuan!;
                            });
                            //Do something when changing the item if you want.
                          },
                          // onSaved: (value) {
                          //   selectedTujuan = value.toString();
                          // },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        border:
                            Border.all(width: 4, color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(25)),
                    child: TextFormField(
                      controller: _namaPemesanTextboxController,
                      focusNode: disabel(),
                      decoration: InputDecoration(
                          hintText: "Name",
                          prefixIcon: Icon(Icons.person),
                          hintStyle: TextStyle(
                              color: Colors.black45,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        border:
                            Border.all(width: 4, color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(25)),
                    child: TextFormField(
                      controller: _alamatTextboxController,
                      focusNode: disabel(),
                      decoration: InputDecoration(
                          hintText: "Address",
                          prefixIcon: Icon(Icons.location_on),
                          hintStyle: TextStyle(
                              color: Colors.black45,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        border:
                            Border.all(width: 4, color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(25)),
                    child: TextFormField(
                      controller: _noteTextboxController,
                      focusNode: disabel(),
                      decoration: InputDecoration(
                          hintText: "Note",
                          prefixIcon: Icon(Icons.notes_outlined),
                          hintStyle: TextStyle(
                              color: Colors.black45,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 90,
                        decoration: BoxDecoration(
                            color: Colors.green.shade50,
                            border: Border.all(
                                width: 2, color: Colors.greenAccent.shade400),
                            borderRadius: BorderRadius.circular(25)),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: _dewasaTextboxController,
                          focusNode: disabel(),
                          decoration: InputDecoration(
                              hintText: "Adult",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 20,
                                  color: Colors.black45),
                              contentPadding: EdgeInsets.only(left: 15),
                              border: InputBorder.none),
                        ),
                      ),
                      Container(
                        width: 110,
                        decoration: BoxDecoration(
                            color: Colors.green.shade50,
                            border: Border.all(
                                width: 2, color: Colors.greenAccent.shade400),
                            borderRadius: BorderRadius.circular(25)),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: _anakTextboxController,
                          focusNode: disabel(),
                          decoration: InputDecoration(
                              hintText: "Children",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 20,
                                  color: Colors.black45),
                              contentPadding: EdgeInsets.only(left: 15),
                              border: InputBorder.none),
                        ),
                      ),
                      Container(
                        width: 90,
                        decoration: BoxDecoration(
                            color: Colors.green.shade50,
                            border: Border.all(
                                width: 2, color: Colors.greenAccent.shade400),
                            borderRadius: BorderRadius.circular(25)),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: _balitaTextboxController,
                          focusNode: disabel(),
                          decoration: InputDecoration(
                              hintText: "Infants",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 20,
                                  color: Colors.black45),
                              contentPadding: EdgeInsets.only(left: 15),
                              border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(width: 2),
                        color: Color(0xff7AD4D9)),
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          var validate = _formKey.currentState!.validate();
                          if (validate) {
                            if (!_isLoading) simpan();
                          }
                        },
                        child: Text("Book Now"),
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Colors.blueAccent),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ))),
                      ),

                      // child: Text(
                      //   "Login",
                      //   style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 15,
                      //       fontWeight: FontWeight.bold),
                      // ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  simpan() {
    String kode_produk = "A11";

    setState(() {
      _isLoading = true;
    });
    Produk createProduk = Produk(id: null);
    createProduk.kodeTicket = kode_produk;
    createProduk.namaPemesan = _namaPemesanTextboxController.text;
    createProduk.alamat = _alamatTextboxController.text;
    createProduk.note = _noteTextboxController.text;
    createProduk.kotaAsal = dropdownAsal;
    createProduk.kotaTujuan = dropdownTujuan;
    createProduk.dewasa = int.parse(_dewasaTextboxController.text);
    createProduk.anak = int.parse(_anakTextboxController.text);
    createProduk.balita = int.parse(_balitaTextboxController.text);
    createProduk.harga = harga(
        int.parse(_dewasaTextboxController.text),
        int.parse(_anakTextboxController.text),
        int.parse(_balitaTextboxController.text));
    ProdukBloc.addProduk(produk: createProduk).then((value) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const Main_Menu()));
    }, onError: (error) {
      showDialog(
          context: context,
          builder: (BuildContext context) => const WarningDialog(
                description: "Simpan gagal, silahkan coba lagi",
              ));
    });
    setState(() {
      _isLoading = false;
    });
  }

  jarak(int berangkat, int pergi) {}

  harga(int dewasa, int anak, int balita) {
    int harga,
        harga_dewasa = 100000,
        harga_anak = 75000,
        harga_balita = 45000,
        total_dewasa,
        total_anak,
        total_balita;

    total_dewasa = harga_dewasa * dewasa;
    total_anak = harga_anak * anak;
    total_balita = harga_balita * balita;

    return harga = total_dewasa + total_anak + total_balita;
  }

  edit() {
    setState(() {
      _isLoading = true;
    });
    Produk updateProduk = Produk(id: null);
    updateProduk.id = widget.produk!.id;
    updateProduk.namaPemesan = _namaPemesanTextboxController.text;
    updateProduk.kotaAsal = _kotaAsalTextboxController.text;
    updateProduk.kotaTujuan = _kotaTujuanTextboxController.text;
    updateProduk.dewasa = int.parse(_dewasaTextboxController.text);
    updateProduk.anak = int.parse(_anakTextboxController.text);
    updateProduk.balita = int.parse(_balitaTextboxController.text);
    updateProduk.harga = harga(
        int.parse(_dewasaTextboxController.text),
        int.parse(_anakTextboxController.text),
        int.parse(_balitaTextboxController.text));
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

class disabel extends FocusNode {
  @override
  bool consumeKeyboardToken() {
    return false;
  }
}
