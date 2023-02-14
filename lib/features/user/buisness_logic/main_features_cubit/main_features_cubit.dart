import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touch_of_beauty/features/user/data/models/services_model.dart';
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
  List<ServicesModel> mainSectionsFeaturedServicesListInHome = [];
  List<ServicesModel> mainSectionsFeaturedServicesListInCenter = [];
  bool getMainSectionServicesListLoading = false;
  bool inHome = true;

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

  void getServicesByMainFeatureId({required int id}) async{
    getMainSectionServicesListLoading = true;
    emit(GetFeaturedMainSectionsServicesLoadingState());
    try{
      final response = await ServicesProvidersRepository.getServicesByMainFeatureId(id: id);
      mainResponse = MainResponse.fromJson(response.data);
      mainSectionsFeaturedServicesListInHome= [];
      mainSectionsFeaturedServicesListInCenter= [];
      for(var element in mainResponse.data){
        if(element['inCenter'] == true){
          mainSectionsFeaturedServicesListInCenter.add(ServicesModel.fromJson(element));
        }
        if(element['inHome'] == true){
          mainSectionsFeaturedServicesListInHome.add(ServicesModel.fromJson(element));
        }
      }
      getMainSectionServicesListLoading = false;
      emit(GetFeaturedMainSectionsServicesSuccess());
    }catch(error){
      print(error.toString());
      emit(GetFeaturedMainSectionsServicesError(error: error.toString()));
    }

  }

  void changeServicesInHomeOrInCenter({required int inHomeZero}){
    if(inHomeZero == 0){
      inHome = true;
      emit(ChangeServicesInHomeOrInCenter());
    }else{
      inHome = false;
      emit(ChangeServicesInHomeOrInCenter());
    }
  }
}
