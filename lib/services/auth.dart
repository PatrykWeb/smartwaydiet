import 'dart:convert';
import "package:http/http.dart" as http;
import "dart:async";
import 'package:shared_preferences/shared_preferences.dart';

class Authorization {

  Future login(String email, String password) async {
    Map data = {
      "email": email, 
      "password": password
    };
    var dataBody = json.encode(data);
    var jsonData;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http.post("http://10.0.2.2:5000/api/auth/login", body: dataBody, headers: {
      "Accept": "Application/json", 
      'Content-Type': 'application/json; charset=UTF-8',
    });
    if(response.statusCode == 200) {
      jsonData = json.decode(response.body);
      sharedPreferences.setString("token", jsonData["token"]);
      print(jsonData["token"]);
      
      return true;
    } else {
      return false;
    }
  }
}