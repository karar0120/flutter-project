class createmoda{
  String name;
  String email;
  String phone;
  String uid;
  bool Emailverfied;
  String image;
  String bio;
  String cover;
  createmoda({this.name,
    this.phone,
    this.email,
    this.uid,
    this.Emailverfied,
    this.image,
    this.bio,
    this.cover,
  });

  createmoda.Fromjson(Map<String,dynamic>json){
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
    uid=json['uid'];
    Emailverfied=json['Emailverfied'];
    image=json['image'];
    bio=json['bio'];
    cover=json['cover'];
      }
      Map<String,dynamic>tomap(){
    return {
      "name":name,
      "email":email,
      "phone":phone,
      "Emailverfied":Emailverfied,
      "uid":uid,
      "bio":bio,
      "image":image,
      "cover":cover,
     // 'image':image,
    };
 }
}