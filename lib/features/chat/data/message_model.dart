class MessageModel{
  dynamic receiverId;
  dynamic senderId;
  dynamic messageText;
  dynamic dateTime;

  MessageModel({
    this.messageText,
    this.receiverId,
    this.senderId,
    this.dateTime
  });

  MessageModel.fromJson(Map<String, dynamic> json){
    receiverId = json['receiverId'];
    senderId = json['senderId'];
    messageText = json['messageText'];
    dateTime = json['dateTime'];
  }

  Map<String, dynamic> toJson(){
    return {
      'receiverId' : receiverId ,
      'senderId' : senderId ,
      'messageText' : messageText ,
      'dateTime':dateTime,
    };
  }
}