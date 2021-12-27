import 'package:flutter/material.dart';
class bmiResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
                Navigator.pop(context);
          },
          ),
          title: Text("BMI RESULT ",),
        ),
        body: Center(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              Text("Gender :male",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              Text("Result :2555 ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              Text("Age :15",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
    );

  }
}
