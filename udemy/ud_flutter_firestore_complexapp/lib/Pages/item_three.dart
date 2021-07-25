import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class ItemThree extends StatefulWidget {
  const ItemThree({Key? key}) : super(key: key);

  @override
  _ItemThreeState createState() => _ItemThreeState();
}

class _ItemThreeState extends State<ItemThree> {
  Future<List<DocumentSnapshot>> _getGridView() async {
    await Firebase.initializeApp();
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot snap = await firestore.collection("gridData").get();
    return snap.docs;
  }

  Future _getRefresh() async {
    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      _getGridView();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _getGridView(),
        builder: (BuildContext context,
            AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return RefreshIndicator(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  var ourData = snapshot.data?[index];
                  return Card(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.network(
                        ourData?.get("img"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
              onRefresh: _getRefresh,
            );
          }
        },
      ),
    );
  }
}
