abstract class ReservationState {}
class ReservationInitial extends ReservationState {}


class ChangedTabBarCurrentIndex extends ReservationState {}


class SendComplainSuccessState extends ReservationState{}
class SendComplainLoadingState extends ReservationState{}
class SendComplainErrorState extends ReservationState{
  final String error;
  SendComplainErrorState(this.error);
}



class GetReservationsSuccessState extends ReservationState{}
class GetReservationsLoadingState extends ReservationState{}
class GetReservationsErrorState extends ReservationState{
  final String error;
  GetReservationsErrorState(this.error);
}