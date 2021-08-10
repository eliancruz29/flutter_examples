import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: const Text("I am poor"),
          backgroundColor: Colors.grey[800],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage(
                "assets/images/i_am_poor.jpg",
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              "I am poor",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
