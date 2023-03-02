
abstract class VendorServicesState {}

class VendorServicesInitial extends VendorServicesState {}


class ChangeServicesInHomeOrInCenter extends VendorServicesState {}


class ChangeButtonState extends VendorServicesState {}


class GetPickedImageSuccessState extends VendorServicesState {}
class GetPickedImageErrorState extends VendorServicesState {}


class GetServicesInHomeOrCenterLoading extends VendorServicesState {}
class GetServicesInHomeOrCenterSuccess extends VendorServicesState {}
class GetServicesInHomeOrCenterError extends VendorServicesState {}
class GetChangedMainSectionId extends VendorServicesState {}


class GetServicesByServiceProviderIdLoading extends VendorServicesState {}
class GetServicesByServiceProviderIdSuccess extends VendorServicesState {}
class GetServicesByServiceProviderIdError extends VendorServicesState {
  final String error;

  GetServicesByServiceProviderIdError({required this.error});

}


class AddServicesLoading extends VendorServicesState {}
class AddServicesSuccess extends VendorServicesState {}
class AddServicesError extends VendorServicesState {
  final String error;

  AddServicesError({required this.error});

}


class GetMainSectionsLoadingState extends VendorServicesState {}
class GetMainSectionsSuccess extends VendorServicesState {}
class GetMainSectionsError extends VendorServicesState {
  final String error;

  GetMainSectionsError({required this.error});

}



class AddEmployeeLoading extends VendorServicesState {}
class AddEmployeeSuccess extends VendorServicesState {}
class AddEmployeeError extends VendorServicesState {
  final String error;
  AddEmployeeError({required this.error});
}

class DeleteEmployeeLoading extends VendorServicesState {}
class DeleteEmployeeSuccess extends VendorServicesState {}
class DeleteEmployeeError extends VendorServicesState {
  final String error;
  DeleteEmployeeError({required this.error});
}

class GetEmployeeLoading extends VendorServicesState {}
class GetEmployeeSuccess extends VendorServicesState {}
class GetEmployeeError extends VendorServicesState {
  final String error;
  GetEmployeeError({required this.error});
}
