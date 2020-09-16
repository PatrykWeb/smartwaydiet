import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartwaydiet/views/Auth/login.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

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
                  height: 420.0,
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
                          child: Image.asset("images/logout.png"),
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
                      SizedBox(height: 48.0,),
                      CircularStepProgressIndicator(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "ILOŚĆ KCAL", 
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "2000",
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                          totalSteps: 2000,
                          currentStep: 1200,
                          stepSize: 10,
                          selectedColor: Colors.greenAccent[400],
                          unselectedColor: Colors.grey[200],
                          padding: 0,
                          width: 150,
                          height: 150,
                          selectedStepSize: 15,
                          roundedCap: (_, __) => true,
                      ),
                      SizedBox(height: 20.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Białka", 
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                ),
                                Container(
                                  width: 80.0,
                                  // padding: EdgeInsets.symmetric(horizontal: 170.0),
                                  child: StepProgressIndicator(
                                      totalSteps: 100,
                                      currentStep: 32,
                                      size: 8,
                                      padding: 0,
                                      selectedColor: Colors.yellow,
                                      unselectedColor: Colors.cyan,
                                      roundedEdges: Radius.circular(10),
                                      selectedGradientColor: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [Colors.greenAccent[400], Colors.greenAccent],
                                      ),
                                      unselectedGradientColor: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [Colors.white, Colors.white],
                                      ),
                                  ),
                                ),
                                Text(
                                  "220g", 
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                )
                              ],
                            ),
                            SizedBox(width: 20.0,),
                            Column(
                              children: [
                                Text(
                                  "Węglowodany", 
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                ),
                                Container(
                                  width: 80.0,
                                  // padding: EdgeInsets.symmetric(horizontal: 170.0),
                                  child: StepProgressIndicator(
                                      totalSteps: 100,
                                      currentStep: 32,
                                      size: 8,
                                      padding: 0,
                                      selectedColor: Colors.yellow,
                                      unselectedColor: Colors.cyan,
                                      roundedEdges: Radius.circular(10),
                                      selectedGradientColor: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [Colors.greenAccent[400], Colors.greenAccent],
                                      ),
                                      unselectedGradientColor: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [Colors.white, Colors.white],
                                      ),
                                  ),
                                ),
                                Text(
                                  "210g", 
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 20.0,),
                             Column(
                               children: [
                                 Text(
                                   "Tłuszcze", 
                                   style: TextStyle(
                                     color: Colors.white
                                   ),
                                 ),
                                  Container(
                                    width: 80.0,
                                    // padding: EdgeInsets.symmetric(horizontal: 170.0),
                                    child: StepProgressIndicator(
                                        totalSteps: 100,
                                        currentStep: 32,
                                        size: 8,
                                        padding: 0,
                                        selectedColor: Colors.yellow,
                                        unselectedColor: Colors.cyan,
                                        roundedEdges: Radius.circular(10),
                                        selectedGradientColor: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [Colors.greenAccent[400], Colors.greenAccent],
                                        ),
                                        unselectedGradientColor: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [Colors.white, Colors.white],
                                        ),
                                    ),
                                ),
                                Text(
                                  "200g",
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                )
                               ],
                             ),
                          ],
                        ),
                     SizedBox(height: 40.0,),
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
                      // Container(
                      //   padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 40.0),
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.only(
                      //       bottomRight: Radius.circular(20.0), 
                      //       bottomLeft: Radius.circular(20.0)
                      //     ),
                      //     color: Colors.greenAccent[400]
                      //   ),
                      //   child: Container(
                      //     child: Column(
                      //       children: [
                      //         // Text(
                      //         //   "TWÓJ NAJBLIŻSZY POSIŁEK", 
                      //         //   style: TextStyle(
                      //         //     fontWeight: FontWeight.w600,
                      //         //     color: Colors.white
                      //         //   ),
                      //         // ),
                      //       Card(
                      //         color: Colors.white,
                      //         child: Column(
                      //           mainAxisSize: MainAxisSize.min,
                      //           children: <Widget>[
                      //             const ListTile(
                      //               // leading: Icon(Icons.album),r
                      //               title: Text(
                      //                 'Spaghetti Bolognese', 
                      //                 textAlign: TextAlign.start,
                      //               ),
                      //               subtitle: Text("Sos bolognese powinno się podawać na makaronie tagliatelle lub pappardelle. Nie powinno się go serwować ze spaghetti, gdyż cienkie nitki mogą nie utrzymać cięższego sosu. Najczęściej tak podaną potrawę posypuje się parmezanem lub drobno startym żółtym serem. Sos można jednak wykorzystać w innych tradycyjnych włoskich potrawach, jak pizza czy lasagne.")
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //       ],
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}