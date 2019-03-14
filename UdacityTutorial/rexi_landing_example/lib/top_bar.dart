import 'package:flutter/material.dart';
import 'package:rexi_landing_example/rexi_colors.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final double _titleSize = 40.0;

  Widget _getTitleText() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          'Re',
          style: TextStyle(
            fontSize: _titleSize,
            fontWeight: FontWeight.w900,
            color: blueRexi,
          ),
        ),
        Text(
          'x',
          style: TextStyle(
            fontSize: _titleSize,
            fontWeight: FontWeight.w900,
            color: yellowRexi,
          ),
        ),
        Text(
          'i',
          style: TextStyle(
            fontSize: _titleSize,
            fontWeight: FontWeight.w900,
            color: blueRexi,
          ),
        ),
      ],
    );
  }

  Widget _getBarOfIconMenu({bool isFullLength = true}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      color: yellowRexi,
      height: 3.5,
      width: isFullLength ? 30.0 : 15.0,
    );
  }

  Widget _getMenuIcon() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 17.0, 0.0, 17.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _getBarOfIconMenu(),
          _getBarOfIconMenu(),
          _getBarOfIconMenu(isFullLength: false),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: _getTitleText(),
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: _getMenuIcon(),
      ),
    );
  }

  @override
  Size get preferredSize => Size(600.0, 60.0);
}
