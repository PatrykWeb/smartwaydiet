import 'package:flutter/material.dart';
import 'package:smartwaydiet/views/AllDiets/all_diet_training.dart';
import 'package:smartwaydiet/views/Auth/login.dart';
import 'package:flutter/services.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => Login(),
      "/training_all": (context) => AllDietTraining()
    },
    theme: ThemeData(fontFamily: "Raleway"),
  ));
});
}
