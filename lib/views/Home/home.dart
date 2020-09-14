import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartwaydiet/views/Auth/login.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SharedPreferences sharedPreferences;

    checkLoginStatus() async {
     sharedPreferences = await SharedPreferences.getInstance(); 
     if(sharedPreferences.getString("token") == null) {
       Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => Login()), (route) => false);
     } else {
       return Home();
     }
  }

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 350.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/home.jpg"),
                      fit: BoxFit.cover 
                    )
                  ),
                  foregroundDecoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 70)
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 50.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                         FlatButton(
                           onPressed: () {
                            sharedPreferences.clear();
                            sharedPreferences.commit();
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Login(),), (route) => false);
                            print(sharedPreferences.getString("token"));
                           },
                          child: Image.network("https://cdn.discordapp.com/attachments/473218411670011904/755093731513860268/logout3.png"),
                          //  icon: Icon(
                          //    Icons.exit_to_app, 
                          //    color: Colors.white,
                          //    size: 30.0,
                          //  ),
                         ),
                        ],
                      ),
                    ],
                  ),
                ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 63.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                       Text(
                          "SMARTWAYDIET", 
                           textAlign: TextAlign.center,
                           style: TextStyle(
                           color: Colors.greenAccent[400], 
                           fontWeight: FontWeight.w600,
                           fontSize: 18.0
                        ),
                      ),
                     SizedBox(height: 216.0,),
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 50.0,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0)
                              ),
                              // color: Color.fromRGBO(73, 228, 109, 0.59)
                              color: Color.fromRGBO(247, 247, 247, 1)
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // backgroundColor: Colors.blueGrey[100],
      // appBar: AppBar(
      //   leading: IconButton(
      //     onPressed: () {
      //       sharedPreferences.clear();
      //       sharedPreferences.commit();
      //       Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Login(),), (route) => false);
      //       print(sharedPreferences.getString("token"));
      //     },
      //     icon: Icon(Icons.exit_to_app),
      //     alignment: Alignment.center,
      //     color: Colors.green[400],
      //     iconSize: 30.0,
      //   ),
      //   backgroundColor: Colors.white,
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //     // Image.network("https://cdn.discordapp.com/attachments/473218411670011904/753232212635287652/watermelon.png"),
      //     //   SizedBox(width: 10.0,),
      //       Text(
      //         "SMARTWAYDIET", 
      //         style: TextStyle(
      //           color: Colors.black
      //         ),
      //       ),
      //       // SizedBox(width: 10.0), 
      //       // Image.network("https://cdn.discordapp.com/attachments/473218411670011904/753340397173997699/tomato.png")
      //     ],
      //   ),
      //   actions: [
      //     IconButton(
      //       onPressed: () {
              
      //       },
      //       icon: Icon(
      //         Icons.person_outline,
      //         size: 32.0,
      //         color: Colors.green[400],
      //       ),
            
      //     )
      //   ],
      //   elevation: 0.0,
      // ),
      // body: SingleChildScrollView(
      //   child: Container(
      //     child: Container(

      //     ),
      //   ),
      // ),
    );
  }
}