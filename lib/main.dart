import 'package:flutter/material.dart';
import 'package:smartwaydiet/services/data.dart';
import 'package:smartwaydiet/views/login.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => Login()
    },
    theme: ThemeData(fontFamily: "Raleway"),
  ));
}
