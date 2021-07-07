import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class ItemTwo extends StatefulWidget {
  const ItemTwo({Key? key}) : super(key: key);

  @override
  _ItemTwoState createState() => _ItemTwoState();
}

class _ItemTwoState extends State<ItemTwo> {
  Future _getHomePosts() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot snap = await firestore.collection("HomeData").get();
    return snap.docs;
  }

  Future<Null> getRegresh() async {
    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      _getHomePosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.grey,
    );
  }
}
