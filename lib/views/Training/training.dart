import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartwaydiet/services/models.dart';
import 'package:smartwaydiet/views/Auth/login.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import "package:http/http.dart" as http;
import 'package:auto_size_text/auto_size_text.dart';


class Training extends StatefulWidget {
  @override
  _TrainingState createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://cdn.discordapp.com/attachments/473218411670011904/760097869482164274/1036780592-1280x720.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Stack(
                children: [
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
                        SizedBox(height: 38.0,),
                        Image.network("https://media.discordapp.net/attachments/473218411670011904/758776712032550932/SPOILER_treadmill-machine2.png"),
                        SizedBox(height: 10.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Spalone kcal",
                                  style: TextStyle(
                                      color: Colors.white70
                                  ),
                                ),
                                SizedBox(height: 5.0,),
                                Container(
                                  width: 280.0,
                                  alignment: Alignment.center,
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
                                  "400 kcal",
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 26.0,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    "Przewiń palcem w dół, aby sprawdzić swoje posiłki",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_downward,
                                    color: Colors.greenAccent[400],
                                  )
                                ],
                              ),
                              height: 40.0,
                              width: MediaQuery.of(context).size.width,
                              // decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.only(
                              //         topLeft: Radius.circular(30.0),
                              //         topRight: Radius.circular(30.0)
                              //     ),
                              //     // color: Color.fromRGBO(73, 228, 109, 0.59)
                              //     color: Color.fromRGBO(247, 247, 247, 1)
                              // ),
                            ),
                            Container(
                                height: 370.0,
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
                                                color: Color.fromRGBO(0, 0, 0, 90),
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
                                                                  "Sałatka owocowa z dodatkiem bitej śmietany",
                                                                style: TextStyle(
                                                                  color: Colors.white
                                                                ),
                                                              ),
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
                                                                      "Czwiczyłem",
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
                                                        Image.network("https://cdn.discordapp.com/attachments/473218411670011904/759158207884034119/icons8-bench-press-50.png")
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
