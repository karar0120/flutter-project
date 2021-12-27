import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie/modal/shopApp/search_Modal.dart';
import 'package:recpie/module/shopApp/Search/Bloc/state.dart';
import 'package:recpie/network/remote/dio_helper.dart';
import 'package:recpie/sherd/consans.dart';
import 'package:recpie/sherd/end_point.dart';

class searchcubit extends Cubit<searchstate>{
  searchcubit() : super(initialState());

  static searchcubit get(context)=> BlocProvider.of(context);

  Searchmodal modal;
  void getsearch({@ required String text}){
    emit(lodingSearchstate());
    diohelper.postdata(
        url: products_search,
         token: tokensssssss,
         data:{
          'text':text,
    }).then((value){
      modal=Searchmodal.fromJson(value.data);
      emit(EnterSearchstate());
    }).catchError((error){
      print(error.toString());
      emit( ErorrSearchstate());
    });

  }


}