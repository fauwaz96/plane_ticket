import 'package:flutter/material.dart';
import 'package:ticketing/bloc/logout_bloc.dart';
import 'package:ticketing/bloc/product_bloc.dart';
import 'package:ticketing/model/produk.dart';
import 'package:ticketing/ui/book_ticket.dart';
import 'package:ticketing/ui/login_menu.dart';
import 'package:ticketing/ui/produk_detail.dart';
import 'package:ticketing/ui/produk_form.dart';
import 'package:ticketing/ui/ticket_seperator.dart';
import 'package:ticketing/ui/edit_ticket_copy.dart';

class ProdukPage extends StatefulWidget {
  const ProdukPage({Key? key}) : super(key: key);

  @override
  _ProdukPageState createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('List Produk'),
      //   actions: [
      //     Padding(
      //         padding: const EdgeInsets.only(right: 20.0),
      //         child: GestureDetector(
      //           child: const Icon(Icons.add, size: 26.0),
      //           onTap: () async {
      //             Navigator.push(context,
      //                 MaterialPageRoute(builder: (context) => Book_Ticket()));
      //           },
      //         ))
      //   ],
      // ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Logout'),
              trailing: const Icon(Icons.logout),
              onTap: () async {
                await LogoutBloc.logout().then((value) => {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Login()))
                    });
              },
            )
          ],
        ),
      ),
      body: FutureBuilder<List>(
        future: ProdukBloc.getProduks(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListProduk(
                  list: snapshot.data,
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ListProduk extends StatelessWidget {
  final List? list;

  const ListProduk({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list!.length,
        itemBuilder: (context, i) {
          return ItemProduk(
            produk: list![i],
          );
        });
  }
}

class ItemProduk extends StatelessWidget {
  final Produk produk;

  const ItemProduk({Key? key, required this.produk}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Edit_Ticket(
                      produk: produk,
                    )));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                produk.kodeTicket ?? "UNKNOWN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      produk.namaPemesan.toString(),
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                    Text(
                      "Rp. " + produk.harga.toString(),
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 48,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      produk.kotaAsal.toString(),
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Stack(
                        children: [
                          Positioned(
                            right: 0,
                            bottom: 0,
                            top: 0,
                            left: 0,
                            child: TicketSeparator(
                              height: 2,
                              color: Colors.grey,
                            ),
                          ),
                          AnimatedPositioned(
                              right: 0,
                              bottom: 0,
                              top: 0,
                              left: 0,
                              duration: Duration(milliseconds: 150),
                              child: RotatedBox(
                                  quarterTurns: 1,
                                  child: Icon(
                                    Icons.flight,
                                    color: Colors.black,
                                  ))),
                          Positioned(
                              left: 0,
                              bottom: 0,
                              top: 0,
                              child: CircleAvatar(
                                radius: 4,
                                backgroundColor: Colors.green,
                              )),
                          Positioned(
                              right: 0,
                              bottom: 0,
                              top: 0,
                              child: CircleAvatar(
                                radius: 4,
                                backgroundColor: Colors.blue,
                              )),
                        ],
                      ),
                    )),
                    Text(
                      produk.kotaTujuan.toString(),
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Dewasa : " + produk.dewasa.toString(),
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "Anak : " + produk.anak.toString(),
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Text(
                    "Balita : " + produk.balita.toString(),
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
