import 'package:flutter/material.dart';
import 'package:smartwaydiet/services/auth.dart';
import 'package:smartwaydiet/views/Home/home.dart';
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
                       Text(
                         "Log In", 
                         style: TextStyle(
                           color: Colors.white, 
                           fontSize: 25.0
                         ),
                       ),
                       SizedBox(height: 10.0),
                       Text(
                         "To log in, your dietitian must create an account for you.", 
                         style: TextStyle(
                           color: Colors.white
                         ),
                       ),
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
                             SizedBox(height: 60.0,)
                           ],
                         ),
                       ),
                       Text(
                         "Welcome", 
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 30.0
                         ),
                         textAlign: TextAlign.center,
                       ),
                       SizedBox(height: 10.0,),
                       Text(
                         "Log in to the application and use the diet recommended by your dietitian!", 
                         style: TextStyle(
                           color: Colors.white70
                         ),
                         textAlign: TextAlign.center,
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
                   backgroundColor: Colors.green[400], 
                   animation: StyledToastAnimation.slideFromLeft, 
                   duration: Duration(seconds: 2),
                  );
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => Home()), (route) => false);
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
      // backgroundColor: Colors.blueGrey[100],
      // appBar: AppBar(
      //   centerTitle: true,
      //   elevation: 0.0,
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Image.network("https://cdn.discordapp.com/attachments/473218411670011904/753232212635287652/watermelon.png"),
      //       SizedBox(width: 10.0,),
      //       Text(
      //         "SMARTWAYDIET",
      //         style: TextStyle(
      //           color: Colors.black
      //         ), 
      //       ),
      //       SizedBox(width: 10.0), 
      //       Image.network("https://cdn.discordapp.com/attachments/473218411670011904/753340397173997699/tomato.png")
      //     ],
      //   ),
      //   backgroundColor: Colors.white,
      // ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Container(
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40.0), bottomRight: Radius.circular(40.0)),
      //           color: Colors.white,
      //         ),
      //         padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: [
      //             Card(
      //               shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(14.0)
      //               ),
      //               color: Colors.green[700],
      //               elevation: 0.0,
      //               child: Column(
      //                 mainAxisSize: MainAxisSize.min,
      //                 children: <Widget>[
      //                   const ListTile(
      //                     title: Text(
      //                       'About us', 
      //                       style: TextStyle(
      //                         color: Colors.white, 
      //                         fontWeight: FontWeight.w600,
      //                       ),
      //                     ),
      //                     subtitle: Text(
      //                       'The dietitian applies the science of nutrition to the feeding and education of groups of people and individuals in health and disease. The scope of dietetic practice is such that dietitians may work in a variety of settings and have a variety of work functions.',
      //                       style: TextStyle(
      //                         color: Colors.white70
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       SizedBox(height: 40.0,),
      //       Column(
      //         children: [
      //           Container(
      //             decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(20.0),
      //             color: Colors.white,
      //             ),
      //             padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 40.0),
      //             child: Column(
      //               children: [
      //                 Row(
      //                   children: [
      //                     Text(
      //                       "Zaloguj sie", 
      //                       style: TextStyle(
      //                         color: Colors.black,
      //                         fontSize: 25.0
      //                       ),
      //                     ),
      //                     SizedBox(width: 10.0,),
      //                     Image.network("https://cdn.discordapp.com/attachments/473218411670011904/753232395737759774/kiwi.png")
      //                   ],
      //                 ),
      //                 SizedBox(height: 30.0,),
      //                   Container(
      //                     padding: EdgeInsets.all(30.0),
      //                     decoration: BoxDecoration(
      //                       borderRadius: BorderRadius.circular(20.0),
      //                       color: Colors.green[700],
      //                     ),
      //                     child: Column(
      //                     children: [
      //                       Form(
      //                         key: _formkey,
      //                         child: Column(
      //                           children: [
      //                             TextFormField(
      //                               validator: (value) => value.isEmpty ? "The email cannot be blank" : null,
      //                               onChanged: (value) {
      //                                 setState(() {
      //                                   email = value;
      //                                 });
      //                               },
      //                               style: TextStyle(
      //                                 color: Colors.white
      //                               ),
      //                               cursorColor: Colors.white,
      //                               decoration: InputDecoration(
      //                                 focusedErrorBorder: UnderlineInputBorder(
      //                                   borderSide: BorderSide(
      //                                     color: Colors.white
      //                                   )
      //                                 ),
      //                                 errorBorder: UnderlineInputBorder(
      //                                   borderSide: BorderSide(
      //                                     color: Colors.white
      //                                   )
      //                                 ),
      //                                 errorStyle: TextStyle(
      //                                   color: Colors.white
      //                                 ),
      //                                 hintText: "Podaj login",
      //                                 hintStyle: TextStyle(
      //                                   color: Colors.white
      //                                 ),
      //                                 labelText: "Login",
      //                                 labelStyle: TextStyle(
      //                                   color: Colors.white
      //                                 ),
      //                                 focusColor: Colors.white, 
      //                                 focusedBorder: UnderlineInputBorder(
      //                                   borderSide: BorderSide(
      //                                     color: Colors.green[800]
      //                                   )
      //                                 ),
      //                                 border: UnderlineInputBorder(
      //                                   borderSide: BorderSide(
      //                                     color: Colors.white
      //                                   )
      //                                 )
      //                               ),
      //                             ),
      //                             SizedBox(height: 20.0,),
      //                             TextFormField(
      //                               validator: (value) => value.isEmpty ? "The password cannot be blank" : null,
      //                               onChanged: (value) {
      //                                 setState(() {
      //                                   password = value;
      //                                 });
      //                               } ,
      //                               obscureText: true,
      //                               style: TextStyle(
      //                                 color: Colors.white
      //                               ),
      //                               cursorColor: Colors.white,
      //                               decoration: InputDecoration(
      //                                 focusedErrorBorder: UnderlineInputBorder(
      //                                   borderSide: BorderSide(
      //                                     color: Colors.white
      //                                   )
      //                                 ),
      //                                 errorBorder: UnderlineInputBorder(
      //                                   borderSide: BorderSide(
      //                                     color: Colors.white
      //                                   )
      //                                 ),
      //                                 errorStyle: TextStyle(
      //                                   color: Colors.white
      //                                 ),
      //                                 hintText: "Podaj hasło",
      //                                 hintStyle: TextStyle(
      //                                   color: Colors.white
      //                                 ),
      //                                 labelText: "Hasło",
      //                                 labelStyle: TextStyle(
      //                                   color: Colors.white
      //                                 ),
      //                                 focusColor: Colors.white, 
      //                                 focusedBorder: UnderlineInputBorder(
      //                                   borderSide: BorderSide(
      //                                     color: Colors.green[600]
      //                                   )
      //                                 ),
      //                                 border: UnderlineInputBorder(
      //                                   borderSide: BorderSide(
      //                                     color: Colors.white
      //                                   )
      //                                 )
      //                               ),
      //                             ),
      //                             SizedBox(height: 20.0,),
      //                             Container(
      //                               child: RaisedButton(
      //                               onPressed: () async {
      //                                 if(_formkey.currentState.validate()) {
      //                                   final result = await _authorization.login(email, password);
      //                                   if(result == true) {
      //                                     showToast(
      //                                       "Zalogowałeś się pomyślnie", 
      //                                       context: context, 
      //                                       backgroundColor: Colors.green[400], 
      //                                       animation: StyledToastAnimation.slideFromLeft, 
      //                                       duration: Duration(seconds: 2),
      //                                     );
      //                                     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => Home()), (route) => false);
      //                                   } else {
      //                                     showToast(
      //                                       "Dane są niepoprawne, spróbuj ponownie", 
      //                                       context: context, 
      //                                       backgroundColor: Colors.red[300], 
      //                                       animation: StyledToastAnimation.slideFromLeft, 
      //                                       duration: Duration(seconds: 2)
      //                                     );
      //                                   }
      //                                 }
      //                               },
      //                               color: Colors.white,
      //                               child: Container(
      //                                 padding: EdgeInsets.only(left: 80.0, right: 80.0),
      //                                 child: Text("Log in"),
      //                               )
      //                             ),
      //                             )
      //                           ],
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                   ),
      //                 SizedBox(height: 10.0,),
      //                 Container(
      //                   child: Column(
      //                     children: [
      //                       RaisedButton(
      //                         color: Colors.white,
      //                         elevation: 0.0,
      //                         onPressed: () {},
      //                         child: Container(
      //                           color: Colors.white,
      //                           child: Text("Nie masz konta? Zarejestruj sie"),
      //                         ),
      //                       )
      //                     ],
      //                   )
      //                 )
      //               ],
      //             ),
      //           ),
      //           SizedBox(height: 25.0),
      //         ],
      //       )
      //     ],
      //   )
      // ),
    );
  }
}