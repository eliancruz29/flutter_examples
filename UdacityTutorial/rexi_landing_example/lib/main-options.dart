import 'package:flutter/material.dart';
import 'package:rexi_landing_example/rexi_colors.dart';

class MainOptions extends StatelessWidget {
  Widget _getProductTypes(String title, IconData icon) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 15.0),
      color: grayShadowRexi,
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            size: 40.0,
            color: yellowRexi,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                letterSpacing: 0.2,
                color: blueRexi,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _getProductTypes('Tarjetas de crédito', Icons.credit_card),
          _getProductTypes('Certificado de depósito', Icons.business_center),
          _getProductTypes('Préstamos', Icons.card_travel),
          _getProductTypes('Cuentas de ahorro', Icons.save),
        ],
      ),
    );
  }
}
