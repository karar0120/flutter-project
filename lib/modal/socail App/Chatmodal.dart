class Chatmodal{
  //String name;
  String dataTime;
  String reciverId;
  String senderId;
  String text;

  Chatmodal({
    //this.name,
    this.text,
    this.reciverId,
    this.senderId,
    this.dataTime,
  });

  Chatmodal.Fromjson(Map<String,dynamic>json){
    text=json['text'];
    reciverId=json['reciverId'];
    dataTime=json['dataTime'];
    senderId=json['senderId'];
  }
  Map<String,dynamic>tomap(){
    return {
      "dataTime":dataTime,
      "senderId":senderId,
      "text":text,
      "reciverId":reciverId,

    };
  }
}