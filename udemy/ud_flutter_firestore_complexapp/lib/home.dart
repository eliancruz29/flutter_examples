import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ud_flutter_firestire_complexapp/Pages/item_one.dart';
import 'package:ud_flutter_firestire_complexapp/Pages/item_two.dart';
import 'package:ud_flutter_firestire_complexapp/Pages/item_three.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indexPage = 1;
  final pageOptions = [
    const ItemOne(),
    const ItemTwo(),
    const ItemThree(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complex App"),
        backgroundColor: Colors.deepOrange,
      ),
      body: pageOptions[_indexPage],
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.deepOrange,
        buttonBackgroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(
          milliseconds: 600,
        ),
        index: _indexPage,
        items: const <Widget>[
          Icon(
            Icons.poll,
            size: 30.0,
            color: Colors.white,
          ),
          Icon(
            Icons.home,
            size: 30.0,
            color: Colors.white,
          ),
          Icon(
            Icons.library_books,
            size: 30.0,
            color: Colors.white,
          ),
        ],
        onTap: (int index) {
          setState(() {
            _indexPage = index;
          });
        },
      ),
    );
  }
}
