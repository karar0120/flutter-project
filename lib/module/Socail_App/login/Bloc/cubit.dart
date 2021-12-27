import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie/module/Socail_App/login/Bloc/state.dart';

class Socailcubit extends Cubit<SocailStatas>{
  Socailcubit() : super(SocailinitialState());

  //Shoplogin ShopLoogin;

  static Socailcubit get(context)=>BlocProvider.of(context);
  void userLogin({
    @required String Email,
    @required String Password
  }
      ){
    emit(SocailloadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: Email, password: Password).then((value){
          emit(SocailEnterState(value.user.uid));
          print(value.user.email);
          print(value.user.uid);
    }).catchError((error){
      print (error.toString());
      emit(SocailErorrState(error));
    });

  }
  IconData suffix=Icons.visibility_outlined;
  bool ispassword=true;
  void passwordIcon(){
    ispassword=!ispassword;

    suffix=ispassword?Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(SocailpasswordState());

  }


}