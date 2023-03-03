
abstract class EmployeesState {}

class EmployeesInitial extends EmployeesState {}

class AddEmployeeLoading extends EmployeesState {}
class AddEmployeeSuccess extends EmployeesState {}
class AddEmployeeError extends EmployeesState {
  final String error;
  AddEmployeeError({required this.error});
}


class DeleteEmployeeLoading extends EmployeesState {}
class DeleteEmployeeSuccess extends EmployeesState {}
class DeleteEmployeeError extends EmployeesState {
  final String error;
  DeleteEmployeeError({required this.error});
}

class GetEmployeeLoading extends EmployeesState {}
class GetEmployeeSuccess extends EmployeesState {}
class GetEmployeeError extends EmployeesState {
  final String error;
  GetEmployeeError({required this.error});
}



class GetProfilePickedImageSuccessState extends EmployeesState {}
class GetPickedImageErrorState extends EmployeesState {}
