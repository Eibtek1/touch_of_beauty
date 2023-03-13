import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touch_of_beauty/features/chat/buisness_logic/chat_state.dart';
import '../data/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  static ChatCubit get(context) => BlocProvider.of(context);


  List<MessageModel> messagesList = [];
  FilePickerResult? filePickerResult;

  void pickFile() async{
    filePickerResult = await FilePicker.platform.pickFiles();
    emit(FilePickedSuccess());
  }

  void sendMessage({
    required dynamic receiverId,
    required dynamic senderId,
    required String? receiverName,
    required String? senderName,
    required String? receiverImg,
    required String? senderImg,
    required String? text,
    required String? dateTime,
    required String? orderId,
    required String? image,
    required String? messageType,
    required String? file,
    required double? lat,
    required double? lng,
  }) async {
    MessageModel model = MessageModel(
      receiverId: receiverId,
      messageText: text,
      dateTime: dateTime,
      senderId: senderId,
      lat: lat,
      lng: lng,
      image: image,
      messageType: messageType,
      file: file
    );
    DocumentSnapshot<Map<String, dynamic>> docUser = await FirebaseFirestore
        .instance
        .collection('users')
        .doc("$senderId")
        .collection("chats")
        .doc("$receiverId")
        .get();
    if (docUser.data() == null) {
      FirebaseFirestore.instance
          .collection('users')
          .doc("$senderId")
          .collection("chats")
          .doc("$receiverId")
          .set({
        "profileImage": receiverImg,
        "name": receiverName,
        "dateTime": dateTime,
        "id": "$receiverId",
        "orderId": orderId,
      }).then((value) {
        FirebaseFirestore.instance
            .collection('users')
            .doc("$senderId")
            .collection('chats')
            .doc("$receiverId")
            .collection('messages')
            .add(model.toJson())
            .then((value) {
          emit(SendMessageSuccess());
        }).catchError((error) {
          emit(SendMessageError(error: error.toString()));
        });
      });
    }
    else {
      FirebaseFirestore.instance
          .collection('users')
          .doc("$senderId")
          .collection("chats")
          .doc("$receiverId")
          .update({"dateTime": dateTime}).then((value) {
        FirebaseFirestore.instance
            .collection('users')
            .doc("$senderId")
            .collection('chats')
            .doc("$receiverId")
            .collection('messages')
            .add(model.toJson())
            .then((value) {
          emit(SendMessageSuccess());
        }).catchError((error) {
          emit(SendMessageError(error: error.toString()));
        });
      });
    }

    DocumentSnapshot<Map<String, dynamic>> docProvider = await FirebaseFirestore
        .instance
        .collection('users')
        .doc("$receiverId")
        .collection("chats")
        .doc("$senderId")
        .get();
    if (docProvider.data() == null) {
      FirebaseFirestore.instance
          .collection('users')
          .doc("$receiverId")
          .collection("chats")
          .doc("$senderId")
          .set({
        "profileImage": senderImg,
        "name": senderName,
        "dateTime": dateTime,
        "id": "$senderId",
        "orderId": orderId,
      }).then((value) {
        FirebaseFirestore.instance
            .collection('users')
            .doc("$receiverId")
            .collection('chats')
            .doc("$senderId")
            .collection('messages')
            .add(model.toJson())
            .then((value) {
          emit(SendMessageSuccess());
        }).catchError((error) {
          emit(SendMessageError(error: error.toString()));
        });
      });
    }
    else {
      FirebaseFirestore.instance
          .collection('users')
          .doc("$receiverId")
          .collection("chats")
          .doc("$senderId")
          .update({"dateTime": dateTime}).then((value) {
        FirebaseFirestore.instance
            .collection('users')
            .doc("$receiverId")
            .collection('chats')
            .doc("$senderId")
            .collection('messages')
            .add(model.toJson())
            .then((value) {
          emit(SendMessageSuccess());
        }).catchError((error) {
          emit(SendMessageError(error: error.toString()));
        });
      });
    }

    //receiver chats
  }

  Future getMessages({required dynamic receiverId, required dynamic senderId}) async {

    FirebaseFirestore.instance
        .collection('users')
        .doc("$senderId")
        .collection('chats')
        .doc("$receiverId")
        .collection('messages')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      messagesList = [];
      for (var element in event.docs.reversed) {
        messagesList.add(MessageModel.fromJson(element.data()));

      }
      print(FirebaseFirestore.instance
          .collection('users')
          .doc("$senderId")
          .collection('chats')
          .doc("$receiverId")
          .collection('messages')
          .orderBy('dateTime')
          .snapshots());
      emit(GetMessageSuccess());
    });
  }
}
