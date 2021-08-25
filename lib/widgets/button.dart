import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyButton extends StatelessWidget {
  final String text, uRl;
  const MyButton({@required this.text, @required this.uRl});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(15),
      ),
      onPressed: () {
        if (uRl != '') {
          launch(uRl);
        }
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
      ),
    );
  }
}

class MyIconButton extends StatelessWidget {
  final Widget icon;
  final String url;
  const MyIconButton({@required this.icon, @required this.url});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          if (url != '') {
            launch(url);
          }
        },
        icon: icon);
  }
}
