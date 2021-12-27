import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie/modal/shopApp/login_modal.dart';
import 'package:recpie/module/shopApp/cubit/states.dart';
import 'package:recpie/network/remote/dio_helper.dart';
import 'package:recpie/sherd/end_point.dart';

import 'state.dart';

class RIGShopcubit extends Cubit<RIGShopStatas>{
  RIGShopcubit() : super(RIGShopinitialState());

  Shoplogin ShopRIG;

  static RIGShopcubit get(context)=>BlocProvider.of(context);
  void userRIG({
    @required String Email,
    @required String Password,
    @required String Name,
    @required String Phone,
  }
      ){
    emit(RIGShoploadingState());
    diohelper.postdata(
        url: REGISTER,
        data: {
          'email':Email,
          'password':Password,
          'name':Name,
          'phone':Phone,
        }

    ).then((value) {
      print (value.data);
      ShopRIG = Shoplogin.formJosn(value.data);
      emit(RIGShopEnterState(ShopRIG));
    }).catchError((erorr){
      print(erorr.toString());
      emit(RIGShopErorrState(erorr.toString()));
    });

  }
  IconData suffix=Icons.visibility_outlined;
  bool ispassword=true;
  void passwordIcon(){
    ispassword=!ispassword;

    suffix=ispassword?Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(RIGShoppasswordState());

  }


}