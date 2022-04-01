class MessageModel{
  late String senderId;
  late String recieverId;
  late String dateTime;
  late String message;

  MessageModel({
    required this.senderId,    required this.recieverId,
    required this.dateTime,    required this.message,
  });
  MessageModel.fromJson(Map<String,dynamic>json){
    senderId=json['senderId'];
    recieverId=json['recieverId'];
    dateTime=json['dateTime'];
    message=json['message'];
  }
  Map<String,dynamic>tomap(){
    return{
      'senderId':senderId,
      'recieverId':recieverId,
      'dateTime':dateTime,
      'message':message,
    };
  }
}