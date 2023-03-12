
abstract class MainState {}

class MainInitial extends MainState {}
class ChangeCurrentIndex extends  MainState{}

class GetUserDataLoading extends  MainState{}
class GetUserDataSuccess extends  MainState{}
class GetUserDataError extends  MainState{
  final String error;

  GetUserDataError({required this.error});
}
