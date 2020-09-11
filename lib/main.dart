import 'package:flutter/material.dart';
import 'package:smartwaydiet/views/Auth/login.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => Login()
    },
    theme: ThemeData(fontFamily: "Raleway"),
  ));
}
