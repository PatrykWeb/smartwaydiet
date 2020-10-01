import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartwaydiet/services/models.dart';
import 'package:smartwaydiet/views/Auth/login.dart';
import 'package:smartwaydiet/views/Home/home.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import "package:http/http.dart" as http;
import 'package:auto_size_text/auto_size_text.dart';

class AllDiet extends StatefulWidget {
  @override
  _AllDietState createState() => _AllDietState();
}

SharedPreferences sharedPreferences;

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


class _AllDietState extends State<AllDiet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://cdn.discordapp.com/attachments/473218411670011904/760547115398201434/diet.jpg"),
            fit: BoxFit.cover
          )
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20.0,),
              Text(
                "SMARTWAYDIET",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.greenAccent[400],
                  fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Przewiń palcem w bok, aby zobaczyć więcej",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  SizedBox(width: 10.0,),
                  Icon(
                      Icons.arrow_forward,
                    color: Colors.greenAccent[400],
                  )
                ],
              ),
              SizedBox(height: 20.0,),
              Stack(
                children: [
                  Container(
                    height: 50.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text(
                              "Poniedziałek",
                            style: TextStyle(
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          color: Colors.greenAccent[400],
                          onPressed: (){},
                        ),
                        SizedBox(width: 10.0,),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color: Colors.greenAccent[400],
                          child: Text(
                              "Wtorek",
                            style: TextStyle(
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          onPressed: (){},
                        ),
                        SizedBox(width: 10.0,),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color: Colors.greenAccent[400],
                          child: Text(
                              "Środa",
                            style: TextStyle(
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          onPressed: (){},
                        ),
                        SizedBox(width: 10.0,),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color: Colors.greenAccent[400],
                          child: Text(
                              "Czwartek",
                            style: TextStyle(
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          onPressed: (){},
                        ),
                        SizedBox(width: 10.0,),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color: Colors.greenAccent[400],
                          child: Text(
                              "Piątek",
                            style: TextStyle(
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          onPressed: (){},
                        )
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 100.0),
                      height: 580.0,
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
                                  // height: 100,
                                  margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
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
                                                              fontWeight: FontWeight.w600
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
                                                    child: AutoSizeText("Sałatka owocowa z dodatkiem bitej śmietany"),
                                                  )
                                                ],
                                              ),
                                              SizedBox(height: 10.0,),
                                              Container(
                                                child: Row(
                                                  children: [
                                                    RaisedButton(
                                                      elevation: 0.0,
                                                      onPressed: () {},
                                                      color: Colors.greenAccent[400],
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "Szczegóły",
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontWeight: FontWeight.w600
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(width: 10.0,),
                                                    RaisedButton(
                                                      elevation: 0.0,
                                                      onPressed: () {},
                                                      color: Colors.greenAccent[400],
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "Zjadłem",
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontWeight: FontWeight.w600
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      ClipRRect(
                                        child: Container(
                                          padding: EdgeInsets.only(right: 20.0, bottom: 10.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                "17:00",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 30.0
                                                ),
                                              ),
                                              Text(
                                                "170 kcal",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        // child: Container(
                                        //   margin: EdgeInsets.only(right: ),
                                        //   child: Text(
                                        //     "17:00",
                                        //     style: TextStyle(
                                        //       fontWeight: FontWeight.w600,
                                        //       fontSize: 30.0
                                        //     ),
                                        //   )
                                        // ),
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
      ),
    );
  }
}
