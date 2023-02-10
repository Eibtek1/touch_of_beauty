abstract class ServicesProvidersState {}

class ServicesProvidersInitial extends ServicesProvidersState {}


class GetFeaturedMainSectionsLoadingState extends ServicesProvidersState {}
class GetFeaturedMainSectionsSuccess extends ServicesProvidersState {}
class GetFeaturedMainSectionsError extends ServicesProvidersState {
  final String error;
  GetFeaturedMainSectionsError({required this.error});
}



class GetFeaturedServicesProvidersLoadingState extends ServicesProvidersState {}
class GetFeaturedServicesProvidersSuccess extends ServicesProvidersState {}
class GetFeaturedServicesProvidersError extends ServicesProvidersState {
  final String error;
  GetFeaturedServicesProvidersError({required this.error});
}
