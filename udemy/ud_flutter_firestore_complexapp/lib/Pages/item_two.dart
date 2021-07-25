import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';

import 'package:flutter/widgets.dart';

class ItemTwo extends StatefulWidget {
  const ItemTwo({Key? key}) : super(key: key);

  @override
  _ItemTwoState createState() => _ItemTwoState();
}

class _ItemTwoState extends State<ItemTwo> {
  Future<List<DocumentSnapshot>> _getHomePosts() async {
    await Firebase.initializeApp();
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot snap = await firestore.collection("HomeData").get();
    return snap.docs;
  }

  Future _getRefresh() async {
    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      _getHomePosts();
    });
  }

  final List<MaterialColor> _colorItem = [
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.deepOrange,
    Colors.pink,
    Colors.amber,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.6),
      body: FutureBuilder(
        future: _getHomePosts(),
        builder: (context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return RefreshIndicator(
              child: ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  var ourData = snapshot.data?[index];
                  var _color = _colorItem[index % _colorItem.length];

                  return Container(
                    height: 406.0,
                    margin: const EdgeInsets.all(10.0),
                    child: Card(
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          // First container
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                CircleAvatar(
                                  child: Text(
                                    ourData?.get("title")[0],
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  backgroundColor: _color,
                                ),
                                const SizedBox(width: 10.0),
                                Text(
                                  ourData?.get("title"),
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: InkWell(
                                        child: const Icon(
                                          Icons.more_horiz,
                                          size: 30.0,
                                        ),
                                        onTap: () {
                                          customDialog(
                                            context,
                                            ourData?.get("image"),
                                            ourData?.get("title"),
                                            ourData?.get("des"),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Container(
                            margin: const EdgeInsets.all(10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.network(
                                ourData?.get("image"),
                                height: 200.0,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          const SizedBox(height: 8.0),

                          Container(
                            margin: const EdgeInsets.all(10.0),
                            child: Text(
                              ourData?.get("des"),
                              maxLines: 4,
                              style: const TextStyle(
                                fontSize: 17.0,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
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

  customDialog(BuildContext ctx, String img, String title, String des) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height / 1.2,
            width: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.deepPurple,
                  Colors.deepOrange,
                  Colors.green,
                ],
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 150.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.network(
                        img,
                        width: MediaQuery.of(context).size.width,
                        height: 150.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6.0),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      title.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      des,
                      style: const TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
