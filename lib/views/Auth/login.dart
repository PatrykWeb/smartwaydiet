import 'package:flutter/material.dart';
import 'package:smartwaydiet/services/auth.dart';
import 'package:smartwaydiet/views/BottomBar/bottomBar.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Authorization _authorization = Authorization();
  String email, password;
  final _formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/tlo.png"),
                      fit: BoxFit.cover 
                    )
                  ),
                  foregroundDecoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 60)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 75.0),
                  child: Text(
                    "SMARTWAYDIET",
                      style: TextStyle(
                       color: Colors.white,
                       fontWeight: FontWeight.w600, 
                       fontSize: 20.0
                  ),
                      textAlign: TextAlign.center,
                  ),
                ),
                 Align(
                  alignment: Alignment.bottomCenter,
                  child: ListView(
                     shrinkWrap: true,
                     padding: EdgeInsets.all(32.0),
                     children: [
                       SizedBox(height: 60.0,), 
                       Form(
                         key: _formkey,
                         child: Column(
                           children: [
                             TextFormField(
                              style: TextStyle(
                                color: Colors.greenAccent[400]
                              ),
                              onChanged: (value) {
                                setState(() {
                                  email = value;
                                 });
                               } ,
                               validator: (value) => value.isEmpty ? "The email cannot be blank" : null,
                               cursorColor: Colors.greenAccent[400],
                               decoration: InputDecoration(
                                 focusColor: Colors.greenAccent[400],
                                 contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                                 suffixIcon: Icon(
                                   Icons.alternate_email, 
                                   color: Colors.greenAccent[400],
                                 ),
                                 hintText: "Email",
                                 hintStyle: TextStyle(
                                   color: Colors.greenAccent[400]
                                 ),
                                 border: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(30.0),
                                 ),
                                 enabledBorder: OutlineInputBorder(
                                   borderSide: BorderSide(
                                     color: Colors.greenAccent[400]
                                   ), 
                                   borderRadius: BorderRadius.circular(30.0)
                                 ),
                                 focusedBorder: OutlineInputBorder(
                                   borderSide: BorderSide(color: Colors.greenAccent[400]),
                                   borderRadius: BorderRadius.circular(30.0)
                                 )
                               ),
                             ),
                             SizedBox(height: 10.0,),
                             TextFormField(
                               style: TextStyle(
                                 color: Colors.greenAccent[400]
                               ),
                               onChanged: (value) {
                                  setState(() {
                                    password = value;
                                    });
                                  },
                               obscureText: true,
                               validator: (value) => value.isEmpty ? "The password cannot be blank" : null,
                               cursorColor: Colors.greenAccent[400],
                               decoration: InputDecoration(
                                 focusColor: Colors.greenAccent[400],
                                 contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                                 suffixIcon: Icon(
                                   Icons.lock_outline, 
                                   color: Colors.greenAccent[400],
                                 ),
                                 hintText: "Password",
                                 hintStyle: TextStyle(
                                   color: Colors.greenAccent[400]
                                 ),
                                 border: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(30.0)
                                 ),
                                 enabledBorder: OutlineInputBorder(
                                   borderSide: BorderSide(
                                     color: Colors.greenAccent[400]
                                   ), 
                                   borderRadius: BorderRadius.circular(30.0)
                                 ),
                                  focusedBorder: OutlineInputBorder(
                                   borderSide: BorderSide(color: Colors.greenAccent[400]),
                                   borderRadius: BorderRadius.circular(30.0)
                                 )
                               ),  
                             ),
                             SizedBox(height: 70.0,)
                           ],
                         ),
                       ),
                       Text(
                         "Log In",
                         textAlign: TextAlign.center, 
                         style: TextStyle(
                           color: Colors.white, 
                           fontSize: 25.0, 
                         ),
                       ),
                       SizedBox(height: 10.0),
                       Text(
                         "To log in, your dietitian must create an account for you.", 
                         textAlign: TextAlign.center,
                         style: TextStyle(
                           color: Colors.white, 
                         ),
                       ),
                       SizedBox(height: 60.0,)
                     ],
                   ),
                 ),
              ],
            ),
          ), 
          RaisedButton(
            padding: EdgeInsets.all(32.0),
            textColor: Colors.white,
            elevation: 0.0,
            color: Colors.greenAccent[400],
            child: Text(
              "Log In".toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.w600, 
                fontSize: 18.0
              ),
            ),
            onPressed: () async {
               if(_formkey.currentState.validate()) {
                final result = await _authorization.login(email, password);
                 if(result == true) {
                   showToast(
                   "Zalogowałeś się pomyślnie", 
                   context: context, 
                   backgroundColor: Colors.greenAccent[400],
                   animation: StyledToastAnimation.slideFromLeft, 
                   duration: Duration(seconds: 2),
                  );
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => BottomBar()), (route) => false);
                  } else {
                   showToast(
                    "Dane są niepoprawne, spróbuj ponownie", 
                    context: context, 
                    backgroundColor: Colors.red[300], 
                    animation: StyledToastAnimation.slideFromLeft, 
                    duration: Duration(seconds: 2)
                  );
                }
              }
            },
          )
        ],
      ),
    );
  }
}