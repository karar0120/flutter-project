import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  List <mydata> users =[
    mydata(
      id: 1,
      names: "Ahmed Muhammed",
      numbers: 01202454113,
    ),
    mydata(
      id: 2,
      names: "Ahmed karar",
      numbers: 01202454115,

    ),
    mydata(
      id:3,
      names: "Ahmed omer",
      numbers: 01202454117,

    ),
    mydata(
      id: 1,
      names: "Ahmed Muhammed",
      numbers: 01202454113,

    ),
    mydata(
      id: 1,
      names: "Ahmed Muhammed",
      numbers: 01202454113,

    ),
    mydata(
      id: 1,
      names: "Ahmed Muhammed",
      numbers: 01202454113,

    ),
    mydata(
      id: 1,
      names: "Ahmed Muhammed",
      numbers: 01202454113,

    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
          appBar: AppBar(
              title:(
                  Text("Users"))
          ),
          body:ListView.separated(
              itemBuilder: (context,index){
                return  Bulidhome(users[index]);
              },
              separatorBuilder: (context,index)=>Padding(
                padding: const EdgeInsetsDirectional.only(
                    start:20
                ),
                child: Container(
                    width: double.infinity,
                    height: 1,
                    color:Colors.grey[300]
                ),
              ),
              itemCount:users.length),
        )
    );
  }
}
Widget Bulidhome(mydata users)=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children:<Widget> [
      CircleAvatar(
        radius: 20,
        child:Text('${users.id}'),
      ),
      SizedBox(
        width: 10,
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget> [
          Text("${users.names}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          Text("${users.numbers}",style: TextStyle(color:Colors.grey),),
        ],
      )
    ],
  ),
);
