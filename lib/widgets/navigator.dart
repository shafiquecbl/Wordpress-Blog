import 'package:flutter/material.dart';

navigator(BuildContext context, Widget page) {
  return Navigator.of(context, rootNavigator: true)
      .push(MaterialPageRoute(builder: (builder) => page));
}
