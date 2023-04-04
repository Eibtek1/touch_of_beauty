
abstract class FreelancerServicesState {}

class FreelancerServicesInitial extends FreelancerServicesState {}



class GetServicesByServiceProviderIdLoading extends FreelancerServicesState {}
class GetServicesByServiceProviderIdSuccess extends FreelancerServicesState {}
class GetServicesByServiceProviderIdError extends FreelancerServicesState {
  final String error;

  GetServicesByServiceProviderIdError({required this.error});

}




class GetServicesDetailsByItsIdLoadingState extends FreelancerServicesState {}
class GetServicesDetailsByItsIdSuccess extends FreelancerServicesState {}
class GetServicesDetailsByItsIdError extends FreelancerServicesState {
  final String error;
  GetServicesDetailsByItsIdError({required this.error});
}