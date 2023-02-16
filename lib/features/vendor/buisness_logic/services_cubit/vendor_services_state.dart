
abstract class VendorServicesState {}

class VendorServicesInitial extends VendorServicesState {}


class ChangeServicesInHomeOrInCenter extends VendorServicesState {}



class GetServicesInHomeOrCenterLoading extends VendorServicesState {}
class GetServicesInHomeOrCenterSuccess extends VendorServicesState {}
class GetServicesInHomeOrCenterError extends VendorServicesState {}


class GetServicesByServiceProviderIdLoading extends VendorServicesState {}
class GetServicesByServiceProviderIdSuccess extends VendorServicesState {}
class GetServicesByServiceProviderIdError extends VendorServicesState {
  final String error;

  GetServicesByServiceProviderIdError({required this.error});

}
