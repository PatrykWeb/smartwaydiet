import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AllDiet extends StatefulWidget {
  @override
  _AllDietState createState() => _AllDietState();
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
