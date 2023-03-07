import 'package:equatable/equatable.dart';

class MessageModel extends Equatable {
  final dynamic receiverId;
  final dynamic senderId;
  final dynamic messageText;
  final dynamic dateTime;
  final dynamic lat;
  final dynamic lng;
  final dynamic messageType;
  final dynamic image;
  final dynamic file;

  const MessageModel({
    this.messageText,
    this.receiverId,
    this.senderId,
    this.dateTime,
    this.lat,
    this.lng,
    this.messageType,
    this.image,
    this.file,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      receiverId: json['receiverId'],
      senderId: json['senderId'],
      messageText: json['messageText'],
      dateTime: json['dateTime'],
      lat: json['lat'],
      lng: json['lng'],
      messageType: json['messageType'],
      image: json['image'],
      file: json['file'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'receiverId': receiverId,
      'senderId': senderId,
      'messageText': messageText ?? "",
      'dateTime': dateTime,
      'lat': lat ?? 0.0,
      'lng': lng ?? 0.0,
      'image': image,
      'messageType': messageType,
      'file': file,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        senderId,
        receiverId,
        messageText,
        dateTime,
        lat,
        lng,
        image,
        messageType,
        file
      ];
}
