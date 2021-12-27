import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie/home_layout/newsApp/states.dart';
import 'package:recpie/module/newsApp/Busnes/busbness.dart';
import 'package:recpie/module/newsApp/scence/scencie.dart';
import 'package:recpie/module/newsApp/sports/sports.dart';
import 'package:recpie/network/remote/dio_helper.dart';

class cubitApp extends Cubit<stateApp> {
  cubitApp() : super(initialState());

  static cubitApp get(context) => BlocProvider.of(context);
  int Currentindex = 0;
  List <BottomNavigationBarItem> buttonNav = [
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: "Sports",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.business_outlined),
      label: "Business",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: "Science",
    ),
    //BottomNavigationBarItem(
      //icon: Icon(Icons.settings),
      //label: "Settings",
    //),
  ];
  List<Widget> Screnns = [
    sports(),
    Business(),
    science(),
    //setting(),
  ];

  void changeButtonNava(index) {
    Currentindex = index;
    emit(NewsButtonNavstate());
  }

  List<dynamic>Busaniess=[];
  void getbusnaiess(){
    emit(NewsBusinessloading());
    diohelper.getdata(
        url:'v2/top-headlines'
        , Qurey:{'country':'us',
                  'category':'business',
      'apiKey':'5d7709efd89f43389f692a07a9a3be1a'
    } ).then((value){
      Busaniess=value.data['articles'];
      //print (value.data[0]['title']);
      emit(NewsBusinessdata());
    }).catchError((onError){
      print ("Error ${onError.toString()}");
      emit(NewsBusinessError(onError.toString()));
    });
  }


  List<dynamic>sportss=[];
  void getsport(){
    emit(NewsSportsloading());
    diohelper.getdata(
        //https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=5d7709efd89f43389f692a07a9a3be1a
        url:'v2/top-headlines'
        , Qurey:{'country':'us',
      'category':'sport',
      'apiKey':'5d7709efd89f43389f692a07a9a3be1a'
    } ).then((value){
      sportss=value.data['articles'];
      //print (value.data[0]['title']);
      emit(NewsSportssdata());
    }).catchError((onError){
      print ("Error ${onError.toString()}");
      emit(NewsSportsError(onError.toString()));
    });
  }



  List<dynamic>sc=[];
  void getsc(){
    emit(Newsscloading());
    diohelper.getdata(
        url:'v2/top-headlines'
        , Qurey:{'country':'us',
      'category':'science',
      'apiKey':'5d7709efd89f43389f692a07a9a3be1a'
    } ).then((value){
      sc=value.data['articles'];
      //print (value.data[0]['title']);
      emit(Newsscsdata());
    }).catchError((onError){
      print ("Error ${onError.toString()}");
      emit(NewsscError(onError.toString()));
    });
  }

  List<dynamic>search=[];
  void getssearch(String value){
    emit(Newssearchloading());
    search=[];
    diohelper.getdata(
        url:'v2/everything'
        , Qurey:{
          'q':'$value',
      'apiKey':'5d7709efd89f43389f692a07a9a3be1a'
    },).then((value){
      search=value.data['articles'];
      //print (value.data[0]['title']);
      emit(Newssearchdata());
    }).catchError((onError){
      print ("Error ${onError.toString()}");
      emit(NewssearchError(onError.toString()));
    });
  }

}


//https://newsapi.org/v2/everything?q=tesla&from=2021-10-02&sortBy=publishedAt&apiKey=5d7709efd89f43389f692a07a9a3be1a