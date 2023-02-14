
abstract class MainFeaturesState {}

class MainFeaturesInitial extends MainFeaturesState {}

class ChangeServicesInHomeOrInCenter extends MainFeaturesState {}


class GetFeaturedMainSectionsLoadingState extends MainFeaturesState {}
class GetFeaturedMainSectionsSuccess extends MainFeaturesState {}
class GetFeaturedMainSectionsError extends MainFeaturesState {
  final String error;
  GetFeaturedMainSectionsError({required this.error});
}


class GetFeaturedMainSectionsServicesLoadingState extends MainFeaturesState {}
class GetFeaturedMainSectionsServicesSuccess extends MainFeaturesState {}
class GetFeaturedMainSectionsServicesError extends MainFeaturesState {
  final String error;
  GetFeaturedMainSectionsServicesError({required this.error});
}

