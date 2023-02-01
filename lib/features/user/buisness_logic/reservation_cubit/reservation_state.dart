abstract class ReservationState {}
class ReservationInitial extends ReservationState {}
class ChangedTabBarCurrentIndex extends ReservationState {}
class SendComplainSuccessState extends ReservationState{}
class SendComplainLoadingState extends ReservationState{}
class SendComplainErrorState extends ReservationState{
  final String error;
  SendComplainErrorState(this.error);
}