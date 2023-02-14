abstract class ServicesProvidersState {}

class ServicesProvidersInitial extends ServicesProvidersState {}


class GetFeaturedServicesProvidersLoadingState extends ServicesProvidersState {}
class GetFeaturedServicesProvidersSuccess extends ServicesProvidersState {}
class GetFeaturedServicesProvidersError extends ServicesProvidersState {
  final String error;
  GetFeaturedServicesProvidersError({required this.error});
}

class GetSliderPhotosLoading extends ServicesProvidersState {}
class GetSliderPhotosSuccess extends ServicesProvidersState {}
class GetSliderPhotosError extends ServicesProvidersState {
  final String error;
  GetSliderPhotosError({required this.error});
}

class GetAllServicesProvidersLoadingState extends ServicesProvidersState {}
class GetAllServicesProvidersSuccess extends ServicesProvidersState {}
class GetAllServicesProvidersError extends ServicesProvidersState {
  final String error;
  GetAllServicesProvidersError({required this.error});
}
