
abstract class MainFeaturesState {}

class MainFeaturesInitial extends MainFeaturesState {}


class GetFeaturedMainSectionsLoadingState extends MainFeaturesState {}
class GetFeaturedMainSectionsSuccess extends MainFeaturesState {}
class GetFeaturedMainSectionsError extends MainFeaturesState {
  final String error;
  GetFeaturedMainSectionsError({required this.error});
}

