import 'package:flutter/material.dart';
import 'package:smartwaydiet/views/Auth/login.dart';
import 'package:flutter/services.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => Login()
    },
    theme: ThemeData(fontFamily: "Raleway"),
  ));
});
}
