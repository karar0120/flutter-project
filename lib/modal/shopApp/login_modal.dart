
class Shoplogin{
bool status;
String message;
ShopUserDatat data;
Shoplogin.formJosn(Map<String,dynamic>json){
  status =json['status'];
  message=json['message'];


  data=json['data']!=null?ShopUserDatat.formJosn(json['data']):null;

}

}

class ShopUserDatat{
  int id ;
  String name;
  String email;
  String phone;
  String image;
  int point;
  int credit;
  String token;
  ShopUserDatat.formJosn(Map<String,dynamic>json){
    id =json['id'];
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
    image =json['image'];
    credit =json['credit'];
    point=json['point'];
    token =json['token'];
  }

}