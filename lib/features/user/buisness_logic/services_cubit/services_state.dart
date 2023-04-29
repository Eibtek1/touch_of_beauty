
abstract class UserServicesState {}

class UserServicesInitial extends UserServicesState {}


class ChangeServicesInHomeOrInCenter extends UserServicesState {}
class ChangeRangeValuesState extends UserServicesState {}
class GetChangedCity extends UserServicesState {}

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


class GetFilteredServicesByServiceProviderIdLoading extends UserServicesState {}
class GetFilteredServicesByServiceProviderIdSuccess extends UserServicesState {}
class GetFilteredServicesByServiceProviderIdError extends UserServicesState {
  final String error;

  GetFilteredServicesByServiceProviderIdError({required this.error});

}




class GetFavoritesServicesLoadingState extends UserServicesState {}
class GetFavoritesServicesSuccess extends UserServicesState {}
class GetFavoritesServicesError extends UserServicesState {
  final String error;
  GetFavoritesServicesError({required this.error});
}


class GetAllQuestionsLoadingState extends UserServicesState {}
class GetAllQuestionsSuccess extends UserServicesState {}
class GetAllQuestionsError extends UserServicesState {
  final String error;
  GetAllQuestionsError({required this.error});
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

class UpdateAddressLoading extends UserServicesState {}
class UpdateAddressSuccess extends UserServicesState {}
class UpdateAddressError extends UserServicesState {
  final String error;
  UpdateAddressError({required this.error});
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




class AddOrderLoading extends UserServicesState {}
class AddOrderSuccess extends UserServicesState {}
class AddOrderError extends UserServicesState {
  final String error;
  AddOrderError({required this.error});
}


class GetServicesDetailsByItsIdLoadingState extends UserServicesState {}
class GetServicesDetailsByItsIdSuccess extends UserServicesState {}
class GetServicesDetailsByItsIdError extends UserServicesState {
  final String error;
  GetServicesDetailsByItsIdError({required this.error});
}


class GetServicesDetailsInCentersBottomSheetByItsIdLoadingState extends UserServicesState {}
class GetServicesDetailsInCentersBottomSheetByItsIdSuccess extends UserServicesState {}
class GetServicesDetailsInCentersBottomSheetByItsIdError extends UserServicesState {
  final String error;
  GetServicesDetailsInCentersBottomSheetByItsIdError({required this.error});
}