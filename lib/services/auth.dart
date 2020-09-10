import "package:http/http.dart" as http;
import "dart:async";

class Authorization {

  Future<String> login(String email, String password) async {
    Map data = {
      "email": email, 
      "password": password
    };
    var response = await http.post("http://localhost:5000/api/auth/login", body: data);
    print("response.body");
  }

}