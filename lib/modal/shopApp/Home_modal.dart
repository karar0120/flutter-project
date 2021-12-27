class Modal{
  bool state;
  DataModal data;
  Modal.Formjson(Map<String,dynamic>json){
    state=json['status'];
    data=DataModal.FromJson(json['data']);

  }
}


class DataModal{
  List<DataModalbanners>banners=new List();
  List<DataModalproudect>products=new List();

  DataModal.FromJson(Map<String,dynamic>json){
    json['banners'].forEach((element){
      banners.add(DataModalbanners.Fromjson(element));
    });

    json['products'].forEach((element){
      products.add(DataModalproudect.Fromjson(element));
    });
  }

}

class DataModalbanners{
int id;
String image;
  DataModalbanners.Fromjson(Map<String,dynamic>json){
    this.id=json['id'];
    this.image=json['image'];
  }

}



class DataModalproudect{

  int id;
  dynamic price;
  dynamic old_price;
  dynamic discount;
  String image;
  String name;
  bool in_favorites;
  bool in_cart;
  DataModalproudect.Fromjson(Map<String,dynamic>json){
    this.id=json['id'];
    this.price=json['price'];
    this.old_price=json['old_price'];
    this.discount=json['discount'];
    this.image=json['image'];
    this.name=json['name'];
    this.in_favorites=json['in_favorites'];
    this.in_cart=json['in_cart'];
}


}