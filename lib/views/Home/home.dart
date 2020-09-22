import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartwaydiet/services/models.dart';
import 'package:smartwaydiet/views/Auth/login.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import "package:http/http.dart" as http;
import 'package:auto_size_text/auto_size_text.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
    takeData();
  }

    Future<List<Products>>takeData() async {
        var res = await http.get("http://www.json-generator.com/api/json/get/cfTsQnQBgy?indent=2");
        var obj = json.decode(res.body);
        List<Products> productsList = [];
        for (var u in obj) {
          Products products = Products(u["index"], u["favoriteFruit"]);
          productsList.add(products);
        }
        print(productsList.length);
        return productsList;
    }

    checkLoginStatus() async {
     sharedPreferences = await SharedPreferences.getInstance(); 
     if(sharedPreferences.getString("token") == null) {
       Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => Login()), (route) => false);
     } else {
       return Home();
     }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(         
        child: Container(   
          decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage("images/home3.png"),
            fit: BoxFit.cover 
            )
          ),    
          child: Column(
            children: [
              Stack(
                children: [
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
                                      color: Colors.white70
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
                                            colors: [Colors.greenAccent[400], Colors.greenAccent[400]],
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
                              SizedBox(width: 35.0,),
                              Column(
                                children: [
                                  Text(
                                    "Węglowodany", 
                                    style: TextStyle(
                                      color: Colors.white70
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
                                            colors: [Colors.greenAccent[400], Colors.greenAccent[400]],
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
                              SizedBox(width: 35.0,),
                               Column(
                                 children: [
                                   Text(
                                     "Tłuszcze", 
                                     style: TextStyle(
                                       color: Colors.white70
                                     ),
                                   ),
                                    Container(
                                      width: 80.0,
                                      // padding: EdgeInsets.symmetric(horizontal: 170.0),
                                      child: StepProgressIndicator(
                                          totalSteps: 100,
                                          currentStep: 82,
                                          size: 8,
                                          padding: 0,
                                          selectedColor: Colors.yellow,
                                          unselectedColor: Colors.cyan,
                                          roundedEdges: Radius.circular(10),
                                          selectedGradientColor: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [Colors.greenAccent[400], Colors.greenAccent[400]],
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
                         SizedBox(height: 10.0,),
                         Text(
                           "test", 
                           style: TextStyle(
                             color: Colors.white
                           ),
                         ),
                         SizedBox(height: 10.0),
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 400.0,
                              width: MediaQuery.of(context).size.width,
                              child: FutureBuilder(
                                future: takeData(),
                                builder: (BuildContext context, AsyncSnapshot snapshot) {
                                  if(snapshot.data == null) {
                                    return Container(
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          backgroundColor: Colors.greenAccent[400],
                                        )
                                      ),
                                    );
                                  } else return ListView.builder(
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return Container(
                                        margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(0, 0, 0, 0.6),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black12,
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0, 3),
                                            ), 
                                          ],
                                          borderRadius: BorderRadius.circular(10.0)
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                padding: EdgeInsets.only(left: 16.0),
                                                width: MediaQuery.of(context).size.width - 100,
                                                child: Column(
                                                  // mainAxisAlignment: MainAxisAlignment.center,
                                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(height: 10.0,),
                                                    Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                                            color: Colors.greenAccent[400]
                                                          ),
                                                          child: Column(
                                                            children: [
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          alignment: Alignment.topLeft,
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                snapshot.data[index].favoriteFruit, 
                                                                style: TextStyle(
                                                                  fontWeight: FontWeight.w600,
                                                                  color: Colors.white
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 2.0,),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: 200.0,
                                                          child: AutoSizeText(
                                                            "adadadadadaadadadaaddadadadadadaadadadadadadadadadadadadadadadadaddasdadadadadadadadadadadada", 
                                                            style: TextStyle(
                                                              color: Colors.white
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Container(
                                                      child: Row(
                                                        children: [
                                                          RaisedButton(
                                                            onPressed: () {},
                                                            child: Text("test"),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            ClipRRect(
                                              child: Container(
                                                width: 100.0,
                                                child: Column(
                                                  children: [
                                                    Text(
                                                        "17:00", 
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w600, 
                                                          fontSize: 30.0,
                                                          color: Colors.white
                                                        ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              borderRadius: BorderRadius.circular(10.0),
                                            )
                                          ],
                                        ),
                                      );
                                    }
                                  );
                                },
                              )
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
     ),
    );
  }
}