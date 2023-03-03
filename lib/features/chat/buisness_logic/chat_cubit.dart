// import 'package:bloc/bloc.dart';
// import 'package:touch_of_beauty/features/chat/buisness_logic/chat_state.dart';
// import '../data/message_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class ChatCubit extends Cubit<ChatState> {
//   ChatCubit() : super(ChatInitial());
//   List<MessageModel> messagesList = [];
//   void sendMessage({
//     required dynamic receiverId,
//     required dynamic userId,
//     required String receiverName,
//     required String receiverImg,
//     required String text,
//     required String dateTime,
//     required String orderId,
//   }) async {
//     MessageModel model = MessageModel(
//       receiverId: receiverId,
//       messageText: text,
//       dateTime: dateTime,
//       senderId: homeLayoutCubit.userData!.id,
//     );
//     DocumentSnapshot<Map<String, dynamic>> docUser = await FirebaseFirestore
//         .instance
//         .collection('users')
//         .doc("$userId")
//         .collection("chats")
//         .doc("$receiverId")
//         .get();
//     if (docUser.data() == null) {
//       FirebaseFirestore.instance
//           .collection('users')
//           .doc("${homeLayoutCubit.userData!.id}")
//           .collection("chats")
//           .doc("$receiverId")
//           .set({
//         "image": receiverImg,
//         "name": receiverName,
//         "dateTime": dateTime,
//         "id": "$receiverId",
//         "orderId": orderId,
//       }).then((value) {
//         FirebaseFirestore.instance
//             .collection('users')
//             .doc("${homeLayoutCubit.userData!.id}")
//             .collection('chats')
//             .doc("$receiverId")
//             .collection('messages')
//             .add(model.toJson())
//             .then((value) {
//           emit(SendMessageSuccess());
//         }).catchError((error) {
//           emit(SendMessageError(error: error.toString()));
//         });
//       });
//     }
//     else {
//       FirebaseFirestore.instance
//           .collection('users')
//           .doc("${homeLayoutCubit.userData!.id}")
//           .collection("chats")
//           .doc("$receiverId")
//           .update({"dateTime": dateTime}).then((value) {
//         FirebaseFirestore.instance
//             .collection('users')
//             .doc("${homeLayoutCubit.userData!.id}")
//             .collection('chats')
//             .doc("$receiverId")
//             .collection('messages')
//             .add(model.toJson())
//             .then((value) {
//           emit(SendMessageSuccess());
//         }).catchError((error) {
//           emit(SendMessageError(error: error.toString()));
//         });
//       });
//     }
//
//     DocumentSnapshot<Map<String, dynamic>> docProvider = await FirebaseFirestore
//         .instance
//         .collection('users')
//         .doc("$receiverId")
//         .collection("chats")
//         .doc("$userId")
//         .get();
//     if (docProvider.data() == null) {
//       FirebaseFirestore.instance
//           .collection('users')
//           .doc("$receiverId")
//           .collection("chats")
//           .doc("$userId")
//           .set({
//         "image": homeLayoutCubit.userData!.image ??
//             'https://firebasestorage.googleapis.com/v0/b/tahlel-6e5f4.appspot.com/o/defaultImage%2FprofilePhoto.png?alt=media&token=8c3f9de7-cf42-4508-bafb-916d5dcec77e',
//         "name": homeLayoutCubit.userData!.name,
//         "dateTime": dateTime,
//         "id": "${homeLayoutCubit.userData!.id}",
//         "orderId": orderId,
//       }).then((value) {
//         FirebaseFirestore.instance
//             .collection('users')
//             .doc("$receiverId")
//             .collection('chats')
//             .doc("$userId")
//             .collection('messages')
//             .add(model.toJson())
//             .then((value) {
//           emit(SendMessageSuccess());
//         }).catchError((error) {
//           emit(SendMessageError(error: error.toString()));
//         });
//       });
//     }
//     else {
//       FirebaseFirestore.instance
//           .collection('users')
//           .doc("$receiverId")
//           .collection("chats")
//           .doc("$userId")
//           .update({"dateTime": dateTime}).then((value) {
//         FirebaseFirestore.instance
//             .collection('users')
//             .doc("$receiverId")
//             .collection('chats')
//             .doc("$userId")
//             .collection('messages')
//             .add(model.toJson())
//             .then((value) {
//           emit(SendMessageSuccess());
//         }).catchError((error) {
//           emit(SendMessageError(error: error.toString()));
//         });
//       });
//     }
//
//     //receiver chats
//   }
// }
