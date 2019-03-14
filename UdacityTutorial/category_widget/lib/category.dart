// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// To keep your imports tidy, follow the ordering guidelines at
// https://www.dartlang.org/guides/language/effective-dart/style#ordering
import 'package:category_widget/converter_route.dart';
import 'package:category_widget/unit.dart';
import 'package:flutter/material.dart';

final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

/// A custom [Category] widget.
///
/// The widget is composed on an [Icon] and [Text]. Tapping on the widget shows
/// a colored [InkWell] animation.
class Category extends StatelessWidget {
  /// Creates a [Category].
  ///
  /// A [Category] saves the name of the Category (e.g. 'Length'), its color for
  /// the UI, and the icon that represents it (e.g. a ruler).
  // TODO: You'll need the name, color, and iconLocation from main.dart
  const Category(
      {Key key,
      @required this.icon,
      @required this.color,
      @required this.text,
      @required this.units})
      : assert(text != null),
        assert(color != null),
        assert(icon != null),
        super(key: key);

  final IconData icon;
  final ColorSwatch color;
  final String text;
  final List<Unit> units;

  /// Navigates to the [ConverterRoute].
  void _navigateToConverter(BuildContext context) {
    // TODO: Using the Navigator, navigate to the [ConverterRoute]
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>
                ConverterRoute(name: text, color: color, units: units)));
  }

  /// Builds a custom widget that shows [Category] information.
  ///
  /// This information includes the icon, name, and color for the [Category].
  @override
  // This `context` parameter describes the location of this widget in the
  // widget tree. It can be used for obtaining Theme data from the nearest
  // Theme ancestor in the tree. Below, we obtain the display1 text theme.
  // See https://docs.flutter.io/flutter/material/Theme-class.html
  Widget build(BuildContext context) {
    // TODO: Build the custom widget here, referring to the Specs.
    return Container(
      height: _rowHeight,
      padding: EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: _borderRadius,
        highlightColor: color,
        splashColor: color,
        onTap: () {
          _navigateToConverter(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Icon(
                  icon,
                  size: 60.0,
                ),
              ),
              Center(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
