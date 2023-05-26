
abstract class WorkHoursState {}

class WorkHoursInitial extends WorkHoursState {}

class ChangeDate extends WorkHoursState {}


class WorkHoursLoading extends WorkHoursState {}
class WorkHoursSuccess extends WorkHoursState {}
class WorkHoursError extends WorkHoursState {
  final String error;

  WorkHoursError(this.error);
}


class GetAvailableWorkHoursLoading extends WorkHoursState {}
class GetAvailableWorkHoursSuccess extends WorkHoursState {}
class GetAvailableWorkHoursError extends WorkHoursState {
  final String error;

  GetAvailableWorkHoursError(this.error);
}

class AddWorkHoursLoading extends WorkHoursState {}
class AddWorkHoursSuccess extends WorkHoursState {}
class AddWorkHoursError extends WorkHoursState {
  final String error;

  AddWorkHoursError(this.error);
}


class UpdateWorkHoursLoading extends WorkHoursState {}
class UpdateWorkHoursSuccess extends WorkHoursState {}
class UpdateWorkHoursError extends WorkHoursState {
  final String error;

  UpdateWorkHoursError(this.error);
}



class DeleteWorkHoursLoading extends WorkHoursState {}
class DeleteWorkHoursSuccess extends WorkHoursState {}
class DeleteWorkHoursError extends WorkHoursState {
  final String error;
  DeleteWorkHoursError(this.error);
}