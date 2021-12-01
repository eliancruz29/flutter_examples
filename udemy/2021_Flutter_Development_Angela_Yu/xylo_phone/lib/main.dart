import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  void playSound(int soundNumber) {
    final _player = AudioCache();
    _player.play('note$soundNumber.wav');
  }

  Expanded _getButton(int soundNumber, Color color) {
    return Expanded(
      child: TextButton(
        onPressed: () => playSound(soundNumber),
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        child: Container(),
      ),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _getButton(1, Colors.red),
                _getButton(2, Colors.orange),
                _getButton(3, Colors.yellow),
                _getButton(4, Colors.green),
                _getButton(5, Colors.teal),
                _getButton(6, Colors.blue),
                _getButton(7, Colors.purple),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
