import 'package:flutter/cupertino.dart';
import 'package:recpie/componaa/fild.dart';
import 'package:recpie/module/shopApp/loginScreen/ShopLogin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class sharedhelper {
  static SharedPreferences sharedPreferences;
  static init() async{
    sharedPreferences=await SharedPreferences.getInstance();
  }
  static Future<bool> putData({@required String Key,@required bool put}) async{
   return await sharedPreferences.setBool(Key, put);
  }
 static dynamic  getData({@required String Key}){
    return sharedPreferences.get(Key);
  }


  static Future<bool>saveData({
  @required String Key,
    @required dynamic value,
  }) async{
if (value is String ) return await sharedPreferences.setString(Key, value);
if (value is int ) return await sharedPreferences.setInt(Key, value);
if (value is bool ) return await sharedPreferences.setBool(Key, value);
 return await sharedPreferences.setDouble(Key, value);
  }

  static Future<bool> removedata({@required String Key}) async{
    return await sharedPreferences.remove(Key);
  }




}
void Logout(context){
  sharedhelper.removedata(Key: 'fuck').then((value) {
    if (value) {
      navigatoandnotreturn(context, ShopLogin());
    }
  });
}