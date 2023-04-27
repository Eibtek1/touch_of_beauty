import 'package:touch_of_beauty/features/authentication/data/models/main_response.dart';

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



class ConfirmOrderLoadingState extends ReservationState{}
class ConfirmOrderSuccessState extends ReservationState{
  final MainResponse mainResponse;

  ConfirmOrderSuccessState({required this.mainResponse});
}
class ConfirmOrderErrorState extends ReservationState{
  final String error;
  ConfirmOrderErrorState(this.error);
}



class AddServiceRatingLoadingState extends ReservationState{}
class AddServiceRatingSuccessState extends ReservationState{
  final MainResponse mainResponse;

  AddServiceRatingSuccessState({required this.mainResponse});
}
class AddServiceRatingErrorState extends ReservationState{
  final String error;
  AddServiceRatingErrorState(this.error);
}




class AddServiceProviderRatingLoadingState extends ReservationState{}
class AddServiceProviderRatingSuccessState extends ReservationState{
  final MainResponse mainResponse;

  AddServiceProviderRatingSuccessState({required this.mainResponse});
}
class AddServiceProviderRatingErrorState extends ReservationState{
  final String error;
  AddServiceProviderRatingErrorState(this.error);
}

class RemoveOrderLoadingState extends ReservationState{}
class RemoveOrderSuccessState extends ReservationState{
  final MainResponse mainResponse;

  RemoveOrderSuccessState({required this.mainResponse});
}
class RemoveOrderErrorState extends ReservationState{
  final String error;
  RemoveOrderErrorState(this.error);
}