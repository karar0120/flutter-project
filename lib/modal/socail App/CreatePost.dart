class Postmodal{
  String name;
  String uid;
  String image;
  String Time;
  String post_Image;
  String text;
  Postmodal({
    this.name,
    this.text,
    this.uid,
    this.image,
    this.post_Image,
    this.Time,
  });

  Postmodal.Fromjson(Map<String,dynamic>json){
    name=json['name'];
    post_Image=json['post_Image'];
    Time=json['Time'];
    uid=json['uid'];
    text=json['text'];
    image=json['image'];
  }
  Map<String,dynamic>tomap(){
    return {
      "name":name,
      "Time":Time,
      "uid":uid,
      "text":text,
      "image":image,
      "post_Image":post_Image,

    };
  }
}