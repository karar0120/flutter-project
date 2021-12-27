class favoritesmodal{
  bool states;
  String massage;
  favoritesmodal.Formjson(Map<String,dynamic>json){
    states=json['status'];
    massage=json['message'];

  }
}

