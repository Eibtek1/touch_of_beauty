import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../authentication/data/models/main_response.dart';
import '../../data/models/main_sections_model.dart';
import '../../data/repository/services_providers_repository.dart';
import 'main_features_state.dart';


class MainFeaturesCubit extends Cubit<MainFeaturesState> {
  MainFeaturesCubit() : super(MainFeaturesInitial());
  static MainFeaturesCubit get(context) {
    return BlocProvider.of(context);
  }

  late MainResponse mainResponse;
  List<MainSectionsModel> mainSectionsFeaturedList = [];
  void getFeaturedMainSections() async{
    emit(GetFeaturedMainSectionsLoadingState());
    try{
      final response = await ServicesProvidersRepository.getFeaturedMainSections();
      mainResponse = MainResponse.fromJson(response.data);
      mainSectionsFeaturedList = [];
      for(var element in mainResponse.data){
        mainSectionsFeaturedList.add(MainSectionsModel.fromJson(element));
      }
      emit(GetFeaturedMainSectionsSuccess());
    }catch(error){
      emit(GetFeaturedMainSectionsError(error: error.toString()));
    }

  }
}
