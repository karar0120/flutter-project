
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie/modal/socail%20App/create%20RIG.dart';

import 'state.dart';

class RIGsocailcubit extends Cubit<RIGsocailStatas>{
  RIGsocailcubit() : super(RIGsocailinitialState());

  //Shoplogin ShopRIG;

  static RIGsocailcubit get(context)=>BlocProvider.of(context);
  void userRIG({
    @required String Email,
    @required String Password,
    @required String Name,
    @required String Phone,
  }){
    emit(RIGsocailloadingState());

    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: Email,
        password: Password).then((value){
          print (value.user.email);
          print(value.user.uid);
          createRIG(
              name: Name,
              phone: Phone,
              email: Email,
              uid:value.user.uid,
            //image: im
            //Emailverfied: false,
          );
          //emit(RIGsocailEnterState());
    } ).catchError((error){
      emit(RIGsocailErorrState(error.toString()));
    });

  }

  void createRIG({
  @required String name,
    @required String phone,
    @required String email,
    @required String uid,
   // @required String image,
    //@required bool Emailverfied,
}){
    createmoda modal=createmoda(
      name:name,
      phone: phone,
      email: email,
      uid: uid,
      Emailverfied: false,
      bio:"Write Your bio....",
      image:"https://image.freepik.com/free-photo/close-up-portrait-pretty-young-woman-isolated_273609-34707.jpg",
      cover:"https://image.freepik.com/free-photo/close-up-portrait-pretty-young-woman-isolated_273609-34707.jpg",
    );

    FirebaseFirestore.instance.collection('users').doc(uid).set(modal.tomap()).
    then((value){
      emit(RIGsocailCreateuserState());
    }).catchError((eror){
      emit(RIGsocailErorusersState(eror));
    });
  }



  IconData suffix=Icons.visibility_outlined;
  bool ispassword=true;
  void passwordIcon(){
    ispassword=!ispassword;

    suffix=ispassword?Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(RIGsocailpasswordState());

  }


}