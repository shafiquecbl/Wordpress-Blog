import 'package:flutter/material.dart';
import 'package:wordpress_blog/constants.dart';

class MyDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 19),
      child: Divider(
        color: greyColor,
        thickness: 0.5,
      ),
    );
  }
}
