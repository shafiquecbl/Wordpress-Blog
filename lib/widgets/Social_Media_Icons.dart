import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wordpress_blog/constants.dart';
import 'package:wordpress_blog/widgets/button.dart';

class SocialMedia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyIconButton(
              icon: FaIcon(
                FontAwesomeIcons.facebook,
                color: Colors.blue,
              ),
              url: facebook),
          MyIconButton(
              icon: FaIcon(
                FontAwesomeIcons.twitter,
                color: Colors.lightBlueAccent,
              ),
              url: twitter),
          MyIconButton(
              icon: FaIcon(
                FontAwesomeIcons.linkedin,
                color: Colors.blueAccent,
              ),
              url: linkedin),
          MyIconButton(
              icon: FaIcon(
                FontAwesomeIcons.instagram,
                color: Colors.redAccent,
              ),
              url: instagram),
        ],
      ),
    );
  }
}
