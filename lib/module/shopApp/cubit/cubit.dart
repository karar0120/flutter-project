import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie/modal/shopApp/login_modal.dart';
import 'package:recpie/module/shopApp/cubit/states.dart';
import 'package:recpie/network/remote/dio_helper.dart';
import 'package:recpie/sherd/end_point.dart';

class Shopcubit extends Cubit<ShopStatas>{
  Shopcubit() : super(ShopinitialState());

   Shoplogin ShopLoogin;

  static Shopcubit get(context)=>BlocProvider.of(context);
  void userLogin({
    @required String Email,
    @required String Password
  }
      ){
    emit(ShoploadingState());
    diohelper.postdata(
        url: LOGIN,
        data: {
          'email':Email,
          'password':Password,
}

).then((value) {
  print (value.data);
  ShopLoogin = Shoplogin.formJosn(value.data);
  emit(ShopEnterState(ShopLoogin));
    }).catchError((erorr){
      print(erorr.toString());
      emit(ShopErorrState(erorr.toString()));
    });

  }
  IconData suffix=Icons.visibility_outlined;
  bool ispassword=true;
  void passwordIcon(){
    ispassword=!ispassword;

    suffix=ispassword?Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(ShoppasswordState());

  }


}