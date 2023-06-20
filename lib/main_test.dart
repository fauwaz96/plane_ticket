import 'package:flutter/material.dart';
import 'package:ticketing/ui/main_menu2.dart';
import 'package:ticketing/ui/book_ticket.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      // home: Book_Ticket(),
      home: Main_Menu(),
    );
  }
}
