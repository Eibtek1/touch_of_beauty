
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



class AddServiceToFavLoading extends UserServicesState {}
class AddServiceToFavSuccess extends UserServicesState {}
class AddServiceToFavError extends UserServicesState {
  final String error;
  AddServiceToFavError({required this.error});
}
