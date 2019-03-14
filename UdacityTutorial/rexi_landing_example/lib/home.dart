import 'package:flutter/material.dart';
import 'package:rexi_landing_example/main-options.dart';
import 'package:rexi_landing_example/top_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: TopBar(),
      body: MainOptions(),
    );
  }
}
