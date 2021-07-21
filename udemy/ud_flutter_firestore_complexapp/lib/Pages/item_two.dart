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
                                  backgroundColor: Colors.deepOrange,
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
                                const Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 10.0),
                                      child: Icon(
                                        Icons.more_horiz,
                                        size: 30.0,
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
}
