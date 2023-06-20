import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:ticketing/bloc/logout_bloc.dart';
import 'package:ticketing/ui/login_menu.dart';
import 'package:ticketing/ui/produk_page.dart';
import 'package:ticketing/ui/registrasi_menu.dart';
import 'package:ticketing/ui/book_ticket.dart';

class Main_Menu extends StatefulWidget {
  const Main_Menu({super.key});

  @override
  State<Main_Menu> createState() => _Main_MenuState();
}

class _Main_MenuState extends State<Main_Menu> {
  int index = 0;

// List Aplikasi
  List<Widget> menu = [
    ProdukPage(),
    Book_Ticket(),
    RegistrasiMenu(),
  ];

// Icon Bottom
  List<Widget> bottom_menu = [
    Icon(
      Icons.home,
      size: 30,
    ),
    Icon(
      Icons.my_library_add,
      size: 30,
    ),
    Icon(
      Icons.shopping_cart,
      size: 30,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        // backgroundColor: Colors.orangeAccent,
        appBar: AppBar(
          title: Text("Main Menu"),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.orangeAccent,
        ),
        body: Center(
          child: MaterialApp(home: menu.elementAt(index)),
          // child: Text(
          //   '$index',
          //   style: TextStyle(
          //       color: Colors.white, fontSize: 120, fontWeight: FontWeight.bold),
          // ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          height: 60,
          items: bottom_menu,
          onTap: (index) => setState(() => this.index = index),
          buttonBackgroundColor: Colors.yellow,
          backgroundColor: Colors.white,
          color: Colors.orangeAccent,
        ),
        drawer: NavigationMenu(),
      ),
    );
  }
}

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[buildHeader(context), buildMenuItem(context)],
          ),
        ),
      );

  Widget buildHeader(BuildContext context) => Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      );

  Widget buildMenuItem(BuildContext context) => Column(
        children: [
          CircleAvatar(
            radius: 55,
            backgroundImage: NetworkImage(
                'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg'),
          ),
          ListTile(
            leading: const Icon(Icons.update),
            title: Text("Edit Profile"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () async {
              await LogoutBloc.logout().then((value) => {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Login()))
                  });
            },
          ),
        ],
      );
}
