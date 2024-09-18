import 'package:flutter/material.dart';

class AppNavigation {
  push(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  pop(BuildContext context) {
    Navigator.pop(context);
  }
}
