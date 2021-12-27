import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recpie/module/BmiApp/result/bmi%20File%20Screan.dart';

class Mt extends StatefulWidget {
  @override
  _MtState createState() => _MtState();
}

class _MtState extends State<Mt> {
  bool x = true;
  double height = 120.0;
  int Wight = 40;
  int Age = 5;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Builder(
            builder: (context) =>
                Scaffold(
                  appBar: AppBar(
                    title: Text("BMI Calculate"),
                  ),
                  body: Column(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      x = true;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: x ? Colors.blue : Colors
                                            .grey[400]
                                    ),
                                    child: Column(
                                      //crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              "assits/image/male.png"),
                                          width: 90,
                                          height: 90,),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text("MALE", style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),)

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      x = false;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: !x ? Colors.blue : Colors
                                            .grey[400]
                                    ),
                                    child: Column(
                                      //crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              "assits/image/female.png"),
                                          width: 90,
                                          height: 90,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text("FEMALE", style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),)

                                      ],
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[400]
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Height", style: TextStyle(fontSize: 25,
                                    fontWeight: FontWeight.bold),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment
                                      .baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: <Widget>[
                                    Text("${height.round()}", style: TextStyle(
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold),),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text("CM", style: TextStyle(fontSize: 20,
                                        fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                Slider(
                                    value: height,
                                    min: 80,
                                    max: 220,
                                    onChanged: (value) {
                                      setState(() {
                                        height = value;
                                      });
                                      print(value.round());
                                    }
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[400]
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Age", style: TextStyle(fontSize: 25,
                                          fontWeight: FontWeight.bold),),
                                      SizedBox(height: 10,),
                                      Text("${Age}", style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: [
                                          FloatingActionButton(
                                              mini: true,
                                              heroTag: 'Age+',
                                              onPressed: () {
                                                setState(() {
                                                  Age++;
                                                });
                                              },
                                              child: Icon(Icons.add)
                                          ),
                                          SizedBox(width: 10,),
                                          FloatingActionButton(
                                              mini: true,
                                              heroTag: 'Age-',
                                              onPressed: () {
                                                setState(() {
                                                  Age--;
                                                });
                                              },
                                              child: Icon(Icons.remove)
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[400]
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Weight", style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),),
                                      SizedBox(height: 10,),
                                      Text("${Wight}", style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: [
                                          FloatingActionButton(
                                              mini: true,
                                              heroTag: 'wight+',
                                              onPressed: () {
                                                setState(() {
                                                  Wight++;
                                                });
                                              },
                                              child: Icon(Icons.add)
                                          ),
                                          SizedBox(width: 10,),
                                          FloatingActionButton(
                                              mini: true,
                                              heroTag: 'wight-',
                                              onPressed: () {
                                                setState(() {
                                                  Wight--;
                                                });
                                              },
                                              child: Icon(Icons.remove)
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        color: Colors.blue,
                        child: MaterialButton(
                          onPressed: () {
                            double result = Wight / pow(height / 100, 2);
                            print(result.round());
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => bmiResult())
                            );
                          },
                          height: 50,
                          child: Text("CALCULATE", style: TextStyle(
                              color: Colors.white, fontSize: 25)),
                        ),
                      )
                    ],

                  ),
                )
        ));
  }
}