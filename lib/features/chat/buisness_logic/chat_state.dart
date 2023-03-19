abstract class ChatState {}

class ChatInitial extends ChatState {}

class SendMessageSuccess extends ChatState{}
class SendMessageError extends ChatState{
  final String error;
  SendMessageError({required this.error});
}
class GetMessageSuccess extends ChatState{}

class GetProfilePickedImageSuccessState extends ChatState{}
class GetProfilePickedImageErrorState extends ChatState{}

class SendImageLoadingState extends ChatState{}
class SendImageSuccessState extends ChatState{}
class SendImageErrorState extends ChatState{}
