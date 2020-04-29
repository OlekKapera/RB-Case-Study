import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {

  static const double radius = 64.0;

  final String _buttonText;
  final Function _onButtonClicked;

  GradientButton(this._buttonText, this._onButtonClicked);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: _onButtonClicked,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      padding: const EdgeInsets.all(0.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(radius)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _buttonText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}