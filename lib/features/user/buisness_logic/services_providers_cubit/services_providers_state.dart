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

class GetFavoritesServicesProvidersLoadingState extends ServicesProvidersState {}
class GetFavoritesServicesProvidersSuccess extends ServicesProvidersState {}
class GetFavoritesServicesProvidersError extends ServicesProvidersState {
  final String error;
  GetFavoritesServicesProvidersError({required this.error});
}

class GetSearchServicesProvidersLoadingState extends ServicesProvidersState {}
class GetSearchServicesProvidersSuccess extends ServicesProvidersState {}
class GetSearchServicesProvidersError extends ServicesProvidersState {
  final String error;
  GetSearchServicesProvidersError({required this.error});
}

class GetServicesProviderDetailsByItsIdLoadingState extends ServicesProvidersState {}
class GetServicesProviderDetailsByItsIdSuccess extends ServicesProvidersState {}
class GetServicesProviderDetailsByItsIdError extends ServicesProvidersState {
  final String error;
  GetServicesProviderDetailsByItsIdError({required this.error});
}

class GetFavoriteServicesProviderDetailsByItsIdLoadingState extends ServicesProvidersState {}
class GetFavoriteServicesProviderDetailsByItsIdSuccess extends ServicesProvidersState {}
class GetFavoriteServicesProviderDetailsByItsIdError extends ServicesProvidersState {
  final String error;
  GetFavoriteServicesProviderDetailsByItsIdError({required this.error});
}


class GetFeaturedServicesProviderDetailsByItsIdLoadingState extends ServicesProvidersState {}
class GetFeaturedServicesProviderDetailsByItsIdSuccess extends ServicesProvidersState {}
class GetFeaturedServicesProviderDetailsByItsIdError extends ServicesProvidersState {
  final String error;
  GetFeaturedServicesProviderDetailsByItsIdError({required this.error});
}

class DeleteServicesProviderToFavLoading extends ServicesProvidersState {}
class DeleteServicesProviderToFavSuccess extends ServicesProvidersState {}
class DeleteServicesProviderToFavError extends ServicesProvidersState {
  final String error;
  DeleteServicesProviderToFavError({required this.error});
}



class AddServicesProviderToFavLoading extends ServicesProvidersState {}
class AddServicesProviderToFavSuccess extends ServicesProvidersState {}
class AddServicesProviderToFavError extends ServicesProvidersState {
  final String error;
  AddServicesProviderToFavError({required this.error});
}

