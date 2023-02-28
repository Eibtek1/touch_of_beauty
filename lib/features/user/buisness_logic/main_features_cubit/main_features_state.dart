
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

class DeleteServiceFromFavSuccess extends MainFeaturesState {}
class DeleteServiceFromFavError extends MainFeaturesState {
  final String error;
  DeleteServiceFromFavError({required this.error});
}



class AddServiceToFavSuccess extends MainFeaturesState {}
class AddServiceToFavError extends MainFeaturesState {
  final String error;
  AddServiceToFavError({required this.error});
}


