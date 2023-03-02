
abstract class UserServicesState {}

class UserServicesInitial extends UserServicesState {}


class ChangeServicesInHomeOrInCenter extends UserServicesState {}
class ChangeRangeValuesState extends UserServicesState {}

class GetCitiesLoading extends UserServicesState {}
class GetCitiesSuccess extends UserServicesState {}
class ChangeButtonState extends UserServicesState {}


class GetServicesInHomeOrCenterLoading extends UserServicesState {}
class GetServicesInHomeOrCenterSuccess extends UserServicesState {}
class GetServicesInHomeOrCenterError extends UserServicesState {}


class GetServicesByServiceProviderIdLoading extends UserServicesState {}
class GetServicesByServiceProviderIdSuccess extends UserServicesState {}
class GetServicesByServiceProviderIdError extends UserServicesState {
  final String error;

  GetServicesByServiceProviderIdError({required this.error});

}




class DeleteServiceFromFavLoading extends UserServicesState {}
class DeleteServiceFromFavSuccess extends UserServicesState {}
class DeleteServiceFromFavError extends UserServicesState {
  final String error;
  DeleteServiceFromFavError({required this.error});
}

class AddAddressLoading extends UserServicesState {}
class AddAddressSuccess extends UserServicesState {}
class AddAddressError extends UserServicesState {
  final String error;
  AddAddressError({required this.error});
}

class DeleteAddressLoading extends UserServicesState {}
class DeleteAddressSuccess extends UserServicesState {}
class DeleteAddressError extends UserServicesState {
  final String error;
  DeleteAddressError({required this.error});
}

class GetAddressLoading extends UserServicesState {}
class GetAddressSuccess extends UserServicesState {}
class GetAddressError extends UserServicesState {
  final String error;
  GetAddressError({required this.error});
}



class GetServicesByMainSectionIdLoadingState extends UserServicesState {}
class GetServicesByMainSectionIdSuccess extends UserServicesState {}
class GetServicesByMainSectionIdError extends UserServicesState {
  final String error;
  GetServicesByMainSectionIdError({required this.error});
}

class AddServiceToFavLoading extends UserServicesState {}
class AddServiceToFavSuccess extends UserServicesState {}
class AddServiceToFavError extends UserServicesState {
  final String error;
  AddServiceToFavError({required this.error});
}


class ChangedTabBarCurrentIndex extends UserServicesState {}
