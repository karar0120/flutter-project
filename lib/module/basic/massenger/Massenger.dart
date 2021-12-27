import 'dart:ffi';

import 'package:flutter/material.dart';
class Messenger extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              titleSpacing: 20.0,
              title: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blue,
                    backgroundImage: NetworkImage("https://i.pinimg.com/564x/83/10/d3/8310d3091cae1a1a050451d31af59573.jpg"),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text("Chats",style: TextStyle(color: Colors.black),),
                ],
              ),
              actions: [
                IconButton(
                    icon: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.blue,
                        child:Icon(Icons.camera_alt,color: Colors.white,size: 16,))
                    , onPressed: (){}
                ),
                IconButton(
                    icon: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.blue,
                        child:Icon(Icons.edit,color: Colors.white,size: 16,))
                    , onPressed: (){}
                ),
              ],
            ),
            body:Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color:Colors.grey[300],
                        borderRadius: BorderRadius.circular(
                          10.0,
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Icon(Icons.search),
                          SizedBox(
                            width: 15,
                          ),
                          Text("Search"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection:  Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          child: Column(
                            children: [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.blue,
                                    backgroundImage: NetworkImage("https://i.pinimg.com/564x/83/10/d3/8310d3091cae1a1a050451d31af59573.jpg"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      bottom:3.0,
                                      end:3.0,
                                    ),
                                    child: CircleAvatar(
                                      radius: 5.0,
                                      backgroundColor: Colors.green,
                                    ),
                                  ),
                                  //Text("Faurouza"),

                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Fayrouza karar Ahmed muhammed Alaaa"
                                ,maxLines: 2,
                                overflow: TextOverflow.ellipsis,),
                            ],
                          ),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          width: 60,
                          child: Column(
                            children: [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.blue,
                                    backgroundImage: NetworkImage("https://i.pinimg.com/564x/83/10/d3/8310d3091cae1a1a050451d31af59573.jpg"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      bottom:3.0,
                                      end:3.0,
                                    ),
                                    child: CircleAvatar(
                                      radius: 5.0,
                                      backgroundColor: Colors.green,
                                    ),
                                  ),
                                  //Text("Faurouza"),

                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Fayrouza karar Ahmed muhammed Alaaa"
                                ,maxLines: 2,
                                overflow: TextOverflow.ellipsis,),
                            ],
                          ),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          width: 60,
                          child: Column(
                            children: [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.blue,
                                    backgroundImage: NetworkImage("https://i.pinimg.com/564x/83/10/d3/8310d3091cae1a1a050451d31af59573.jpg"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      bottom:3.0,
                                      end:3.0,
                                    ),
                                    child: CircleAvatar(
                                      radius: 5.0,
                                      backgroundColor: Colors.green,
                                    ),
                                  ),
                                  //Text("Faurouza"),

                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Fayrouza karar Ahmed muhammed Alaaa"
                                ,maxLines: 2,
                                overflow: TextOverflow.ellipsis,),
                            ],
                          ),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          width: 60,
                          child: Column(
                            children: [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.blue,
                                    backgroundImage: NetworkImage("https://i.pinimg.com/564x/83/10/d3/8310d3091cae1a1a050451d31af59573.jpg"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      bottom:3.0,
                                      end:3.0,
                                    ),
                                    child: CircleAvatar(
                                      radius: 5.0,
                                      backgroundColor: Colors.green,
                                    ),
                                  ),
                                  //Text("Faurouza"),

                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Fayrouza karar Ahmed muhammed Alaaa"
                                ,maxLines: 2,
                                overflow: TextOverflow.ellipsis,),
                            ],
                          ),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          width: 60,
                          child: Column(
                            children: [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.blue,
                                    backgroundImage: NetworkImage("https://i.pinimg.com/564x/83/10/d3/8310d3091cae1a1a050451d31af59573.jpg"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      bottom:3.0,
                                      end:3.0,
                                    ),
                                    child: CircleAvatar(
                                      radius: 5.0,
                                      backgroundColor: Colors.green,
                                    ),
                                  ),
                                  //Text("Faurouza"),

                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Fayrouza karar Ahmed muhammed Alaaa"
                                ,maxLines: 2,
                                overflow: TextOverflow.ellipsis,),
                            ],
                          ),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          width: 60,
                          child: Column(
                            children: [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.blue,
                                    backgroundImage: NetworkImage("https://i.pinimg.com/564x/83/10/d3/8310d3091cae1a1a050451d31af59573.jpg"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      bottom:3.0,
                                      end:3.0,
                                    ),
                                    child: CircleAvatar(
                                      radius: 5.0,
                                      backgroundColor: Colors.green,
                                    ),
                                  ),
                                  //Text("Faurouza"),

                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Fayrouza karar Ahmed muhammed Alaaa"
                                ,maxLines: 2,
                                overflow: TextOverflow.ellipsis,),
                            ],
                          ),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          width: 60,
                          child: Column(
                            children: [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.blue,
                                    backgroundImage: NetworkImage("https://i.pinimg.com/564x/83/10/d3/8310d3091cae1a1a050451d31af59573.jpg"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      bottom:3.0,
                                      end:3.0,
                                    ),
                                    child: CircleAvatar(
                                      radius: 5.0,
                                      backgroundColor: Colors.green,
                                    ),
                                  ),
                                  //Text("Faurouza"),

                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Fayrouza karar Ahmed muhammed Alaaa"
                                ,maxLines: 2,
                                overflow: TextOverflow.ellipsis,),
                            ],
                          ),
                        ),
                        SizedBox(width: 10,),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 30,),
                          Row(
                            children:<Widget> [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.blue,
                                    backgroundImage: NetworkImage("https://i.pinimg.com/564x/83/10/d3/8310d3091cae1a1a050451d31af59573.jpg"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      bottom:3.0,
                                      end:3.0,
                                    ),
                                    child: CircleAvatar(
                                      radius: 5.0,
                                      backgroundColor: Colors.green,
                                    ),
                                  ),
                                  //Text("Faurouza"),

                                ],
                              ),
                              SizedBox(height: 20,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Fayrouza karar Ahmed muhammed Alaaa kkkkkk",
                                      maxLines: 1,
                                      overflow:TextOverflow.ellipsis ,
                                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                    SizedBox(height: 5.0,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10
                                      ),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(child:
                                          Text("Hello Ahmed What's need",maxLines: 2,overflow: TextOverflow.ellipsis,)
                                          ),
                                          Container(
                                            width: 10,
                                            height: 10,
                                            decoration:BoxDecoration(
                                                color: Colors.blue,
                                                shape: BoxShape.circle
                                            ) ,
                                          ),
                                          SizedBox(width: 10,),
                                          Text("02:8 PM")
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )

                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children:<Widget> [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.blue,
                                    backgroundImage: NetworkImage("https://i.pinimg.com/564x/83/10/d3/8310d3091cae1a1a050451d31af59573.jpg"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      bottom:3.0,
                                      end:3.0,
                                    ),
                                    child: CircleAvatar(
                                      radius: 5.0,
                                      backgroundColor: Colors.green,
                                    ),
                                  ),
                                  //Text("Faurouza"),

                                ],
                              ),
                              SizedBox(height: 20,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Fayrouza karar Ahmed muhammed Alaaa kkkkkk",
                                      maxLines: 1,
                                      overflow:TextOverflow.ellipsis ,
                                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                    SizedBox(height: 5.0,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10
                                      ),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(child:
                                          Text("Hello Ahmed What's need",maxLines: 2,overflow: TextOverflow.ellipsis,)
                                          ),
                                          Container(
                                            width: 10,
                                            height: 10,
                                            decoration:BoxDecoration(
                                                color: Colors.blue,
                                                shape: BoxShape.circle
                                            ) ,
                                          ),
                                          SizedBox(width: 10,),
                                          Text("02:8 PM")
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )

                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children:<Widget> [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.blue,
                                    backgroundImage: NetworkImage("https://i.pinimg.com/564x/83/10/d3/8310d3091cae1a1a050451d31af59573.jpg"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      bottom:3.0,
                                      end:3.0,
                                    ),
                                    child: CircleAvatar(
                                      radius: 5.0,
                                      backgroundColor: Colors.green,
                                    ),
                                  ),
                                  //Text("Faurouza"),

                                ],
                              ),
                              SizedBox(height: 20,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Fayrouza karar Ahmed muhammed Alaaa kkkkkk",
                                      maxLines: 1,
                                      overflow:TextOverflow.ellipsis ,
                                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                    SizedBox(height: 5.0,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10
                                      ),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(child:
                                          Text("Hello Ahmed What's need",maxLines: 2,overflow: TextOverflow.ellipsis,)
                                          ),
                                          Container(
                                            width: 10,
                                            height: 10,
                                            decoration:BoxDecoration(
                                                color: Colors.blue,
                                                shape: BoxShape.circle
                                            ) ,
                                          ),
                                          SizedBox(width: 10,),
                                          Text("02:8 PM")
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )

                            ],
                          ),SizedBox(height: 10,),
                          Row(
                            children:<Widget> [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.blue,
                                    backgroundImage: NetworkImage("https://i.pinimg.com/564x/83/10/d3/8310d3091cae1a1a050451d31af59573.jpg"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      bottom:3.0,
                                      end:3.0,
                                    ),
                                    child: CircleAvatar(
                                      radius: 5.0,
                                      backgroundColor: Colors.green,
                                    ),
                                  ),
                                  //Text("Faurouza"),

                                ],
                              ),
                              SizedBox(height: 20,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Fayrouza karar Ahmed muhammed Alaaa kkkkkk",
                                      maxLines: 1,
                                      overflow:TextOverflow.ellipsis ,
                                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                    SizedBox(height: 5.0,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10
                                      ),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(child:
                                          Text("Hello Ahmed What's need",maxLines: 2,overflow: TextOverflow.ellipsis,)
                                          ),
                                          Container(
                                            width: 10,
                                            height: 10,
                                            decoration:BoxDecoration(
                                                color: Colors.blue,
                                                shape: BoxShape.circle
                                            ) ,
                                          ),
                                          SizedBox(width: 10,),
                                          Text("02:8 PM")
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )

                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children:<Widget> [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.blue,
                                    backgroundImage: NetworkImage("https://i.pinimg.com/564x/83/10/d3/8310d3091cae1a1a050451d31af59573.jpg"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      bottom:3.0,
                                      end:3.0,
                                    ),
                                    child: CircleAvatar(
                                      radius: 5.0,
                                      backgroundColor: Colors.green,
                                    ),
                                  ),
                                  //Text("Faurouza"),

                                ],
                              ),
                              SizedBox(height: 20,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Fayrouza karar Ahmed muhammed Alaaa kkkkkk",
                                      maxLines: 1,
                                      overflow:TextOverflow.ellipsis ,
                                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                    SizedBox(height: 5.0,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10
                                      ),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(child:
                                          Text("Hello Ahmed What's need",maxLines: 2,overflow: TextOverflow.ellipsis,)
                                          ),
                                          Container(
                                            width: 10,
                                            height: 10,
                                            decoration:BoxDecoration(
                                                color: Colors.blue,
                                                shape: BoxShape.circle
                                            ) ,
                                          ),
                                          SizedBox(width: 10,),
                                          Text("02:8 PM")
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )

                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children:<Widget> [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.blue,
                                    backgroundImage: NetworkImage("https://i.pinimg.com/564x/83/10/d3/8310d3091cae1a1a050451d31af59573.jpg"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      bottom:3.0,
                                      end:3.0,
                                    ),
                                    child: CircleAvatar(
                                      radius: 5.0,
                                      backgroundColor: Colors.green,
                                    ),
                                  ),
                                  //Text("Faurouza"),

                                ],
                              ),
                              SizedBox(height: 20,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Fayrouza karar Ahmed muhammed Alaaa kkkkkk",
                                      maxLines: 1,
                                      overflow:TextOverflow.ellipsis ,
                                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                    SizedBox(height: 5.0,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10
                                      ),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(child:
                                          Text("Hello Ahmed What's need",maxLines: 2,overflow: TextOverflow.ellipsis,)
                                          ),
                                          Container(
                                            width: 10,
                                            height: 10,
                                            decoration:BoxDecoration(
                                                color: Colors.blue,
                                                shape: BoxShape.circle
                                            ) ,
                                          ),
                                          SizedBox(width: 10,),
                                          Text("02:8 PM")
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )

                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children:<Widget> [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.blue,
                                    backgroundImage: NetworkImage("https://i.pinimg.com/564x/83/10/d3/8310d3091cae1a1a050451d31af59573.jpg"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      bottom:3.0,
                                      end:3.0,
                                    ),
                                    child: CircleAvatar(
                                      radius: 5.0,
                                      backgroundColor: Colors.green,
                                    ),
                                  ),
                                  //Text("Faurouza"),

                                ],
                              ),
                              SizedBox(height: 20,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Fayrouza karar Ahmed muhammed Alaaa kkkkkk",
                                      maxLines: 1,
                                      overflow:TextOverflow.ellipsis ,
                                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                    SizedBox(height: 5.0,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10
                                      ),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(child:
                                          Text("Hello Ahmed What's need",maxLines: 2,overflow: TextOverflow.ellipsis,)
                                          ),
                                          Container(
                                            width: 10,
                                            height: 10,
                                            decoration:BoxDecoration(
                                                color: Colors.blue,
                                                shape: BoxShape.circle
                                            ) ,
                                          ),
                                          SizedBox(width: 10,),
                                          Text("02:8 PM")
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )

                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children:<Widget> [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.blue,
                                    backgroundImage: NetworkImage("https://i.pinimg.com/564x/83/10/d3/8310d3091cae1a1a050451d31af59573.jpg"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      bottom:3.0,
                                      end:3.0,
                                    ),
                                    child: CircleAvatar(
                                      radius: 5.0,
                                      backgroundColor: Colors.green,
                                    ),
                                  ),
                                  //Text("Faurouza"),

                                ],
                              ),
                              SizedBox(height: 20,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Fayrouza karar Ahmed muhammed Alaaa kkkkkk",
                                      maxLines: 1,
                                      overflow:TextOverflow.ellipsis ,
                                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                    SizedBox(height: 5.0,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10
                                      ),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(child:
                                          Text("Hello Ahmed What's need",maxLines: 2,overflow: TextOverflow.ellipsis,)
                                          ),
                                          Container(
                                            width: 10,
                                            height: 10,
                                            decoration:BoxDecoration(
                                                color: Colors.blue,
                                                shape: BoxShape.circle
                                            ) ,
                                          ),
                                          SizedBox(width: 10,),
                                          Text("02:8 PM")
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
        )
    );
  }

}