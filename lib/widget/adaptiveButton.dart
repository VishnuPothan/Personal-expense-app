import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveButton extends StatelessWidget {
  final String text;
  final Function handler;

  AdaptiveButton(this.text, this.handler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: handler,
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'AirbnbCereal',
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : FlatButton(
            onPressed: handler,
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'AirbnbCereal',
                fontWeight: FontWeight.bold,
              ),
            ),
            textColor: Theme.of(context).primaryColor,
          );
  }
}
