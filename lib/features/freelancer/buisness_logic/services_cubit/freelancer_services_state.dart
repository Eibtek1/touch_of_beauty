
abstract class FreelancerServicesState {}

class FreelancerServicesInitial extends FreelancerServicesState {}



class GetServicesByServiceProviderIdLoading extends FreelancerServicesState {}
class GetServicesByServiceProviderIdSuccess extends FreelancerServicesState {}
class GetServicesByServiceProviderIdError extends FreelancerServicesState {
  final String error;

  GetServicesByServiceProviderIdError({required this.error});

}