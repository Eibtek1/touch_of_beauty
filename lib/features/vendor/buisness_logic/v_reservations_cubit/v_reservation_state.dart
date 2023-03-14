
abstract class VReservationState {}

class VReservationInitial extends VReservationState {}



class GetPreparedOrdersLoading extends VReservationState {}
class GetPreparedOrdersSuccess extends VReservationState {}
class GetPreparedOrdersError extends VReservationState {
  final String error;
  GetPreparedOrdersError({required this.error});
}

class GetConfirmedOrdersLoading extends VReservationState {}
class GetConfirmedOrdersSuccess extends VReservationState {}
class GetConfirmedOrdersError extends VReservationState {
  final String error;
  GetConfirmedOrdersError({required this.error});
}

class GetTodayOrdersLoading extends VReservationState {}
class GetTodayOrdersSuccess extends VReservationState {}
class GetTodayOrdersError extends VReservationState {
  final String error;
  GetTodayOrdersError({required this.error});
}

class GetWithDriverOrdersLoading extends VReservationState {}
class GetWithDriverOrdersSuccess extends VReservationState {}
class GetWithDriverOrdersError extends VReservationState {
  final String error;
  GetWithDriverOrdersError({required this.error});
}

class GetFinishedOrdersLoading extends VReservationState {}
class GetFinishedOrdersSuccess extends VReservationState {}
class GetFinishedOrdersError extends VReservationState {
  final String error;
  GetFinishedOrdersError({required this.error});
}

class GetCanceledOrdersLoading extends VReservationState {}
class GetCanceledOrdersSuccess extends VReservationState {}
class GetCanceledOrdersError extends VReservationState {
  final String error;
  GetCanceledOrdersError({required this.error});
}

class GetOrderByItsIdLoading extends VReservationState {}
class GetOrderByItsIdSuccess extends VReservationState {}
class GetOrderByItsIdError extends VReservationState {
  final String error;
  GetOrderByItsIdError({required this.error});
}

class ChangeOrderStatusLoading extends VReservationState {}
class ChangeOrderStatusSuccess extends VReservationState {}
class ChangeOrderStatusError extends VReservationState {
  final String error;
  ChangeOrderStatusError({required this.error});
}