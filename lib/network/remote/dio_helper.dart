import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class diohelper{
  static Dio dio;
  static init (){
    dio=Dio(
        BaseOptions(
          baseUrl:'https://student.valuxapps.com/api/',
          receiveDataWhenStatusError: true,
        )
    );
  }
  static Future<Response> getdata({
    @required String url,
    Map<String, dynamic>Qurey,
    String token,
    String lang='en'})async {
    dio.options.headers={
      'Content-Type':'application/json',
      'lang':lang,

      'Authorization':token??'',


    };
    return await dio.get(url,queryParameters: Qurey);
  }

  static Future<Response>postdata ({
  @required String url,
    Map<String, dynamic>Qurey,
    @required Map<String, dynamic> data,
    String token,
    String lang='en',
  }) async{
    dio.options.headers={
      'Content-Type':'application/json',
      'lang':lang,

      'Authorization':token??'',

    };
    return dio.post(url,queryParameters: Qurey,data: data);
}

  static Future<Response>putdata ({
    @required String url,
    Map<String, dynamic>Qurey,
    @required Map<String, dynamic> data,
    String token,
    String lang='en',
  }) async{
    dio.options.headers={
      'Content-Type':'application/json',
      'lang':lang,

      'Authorization':token??'',

    };
    return dio.put(url,queryParameters: Qurey,data: data);
  }




}

//https://www.postman.com/collections/3223d639447a8524e38f