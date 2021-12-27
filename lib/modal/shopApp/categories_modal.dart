class categoriesModal{
  bool status;
  categoriesModalData data;
  categoriesModal.Fromjson(Map<String,dynamic>json){
   status=json['status'];
   data=categoriesModalData.Fromjson(json['data']);

  }
}


class categoriesModalData{
  int current_page;
  List<Modaldata>data=[];
  categoriesModalData.Fromjson(Map<String,dynamic>json){
    current_page=json['current_page'];
    json['data'].forEach((element){
      data.add(Modaldata.Fromjson(element));
    });

    }
  }


class Modaldata{
  int id;
  String name;
  String image;
  Modaldata.Fromjson(Map<String,dynamic>json){
    id =json['id'];
    name=json['name'];
    image=json['image'];
  }
}