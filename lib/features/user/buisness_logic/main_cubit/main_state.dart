
abstract class MainState {}

class MainInitial extends MainState {}
class ChangeCurrentIndex extends  MainState{}

class GetUserDataLoading extends  MainState{}
class GetUserDataSuccess extends  MainState{}
class GetUserDataError extends  MainState{
  final String error;

  GetUserDataError({required this.error});
}

class GetNotificationLoading extends  MainState{}
class GetNotificationSuccess extends  MainState{}
class GetNotificationError extends  MainState{
  final String error;

  GetNotificationError({required this.error});
}



