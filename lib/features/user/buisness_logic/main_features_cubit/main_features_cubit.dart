import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touch_of_beauty/features/user/data/models/services_model.dart';
import '../../../authentication/data/models/main_response.dart';
import '../../data/models/main_sections_model.dart';
import '../../data/models/paginate_model.dart';
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
  List<ServicesModel> servicesList = [];
  List<ServicesModel> searchList = [];
  Map<dynamic , bool> favorites = {} ;
  String servicesSearchMessage ='';
  bool getMainSectionServicesListLoading = false;
  bool inHome = true;
  int? mainFeaturesId;
  int servicesPageNumber = 1;
  int searchServicesPageNumber = 1;
  PaginateModel? searchPaginateModel;
  ServicesModel? servicesModel;
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

  // void getServicesByMainFeatureId({required int id}) async{
  //   getMainSectionServicesListLoading = true;
  //   emit(GetFeaturedMainSectionsServicesLoadingState());
  //   try{
  //     final response = await ServicesProvidersRepository.getServicesByMainFeatureId(id: id);
  //     mainResponse = MainResponse.fromJson(response.data);
  //     mainSectionsFeaturedServicesListInHome= [];
  //     mainSectionsFeaturedServicesListInCenter= [];
  //     for(var element in mainResponse.data){
  //       if(element['inCenter'] == true){
  //         mainSectionsFeaturedServicesListInCenter.add(ServicesModel.fromJson(element));
  //       }
  //       if(element['inHome'] == true){
  //         mainSectionsFeaturedServicesListInHome.add(ServicesModel.fromJson(element));
  //       }
  //     }
  //     getMainSectionServicesListLoading = false;
  //     emit(GetFeaturedMainSectionsServicesSuccess());
  //   }catch(error){
  //     if (kDebugMode) {
  //       print(error.toString());
  //     }
  //     emit(GetFeaturedMainSectionsServicesError(error: error.toString()));
  //   }
  //
  // }

  void getServicesByMainFeaturesId({
    int? mainSectionId,
  }) async {
    try {
      mainFeaturesId = mainSectionId;
      if (servicesPageNumber == 1) {
        searchPaginateModel =null;
        servicesList = [];
        getMainSectionServicesListLoading = true;
        emit(GetFeaturedMainSectionsServicesLoadingState());
      }
      final response = await ServicesProvidersRepository.getServices(
        pageNumber: servicesPageNumber,
        pageSize: 15,
        mainSectionId: mainSectionId,
      );
      mainResponse = MainResponse.fromJson(response.data);
      if (mainResponse.errorCode == 0) {
        searchPaginateModel = PaginateModel.fromJson(mainResponse.data);
        if(searchPaginateModel!.items !=null){
          if (servicesPageNumber == 1) {
            for (var element in searchPaginateModel!.items) {
              servicesList.add(ServicesModel.fromJson(element));
              if(!favorites.containsKey(element['id'])){
                favorites.addAll({element['id']: element['isFavourite']});
              }
            }
            servicesPageNumber++;
          } else if (servicesPageNumber <= searchPaginateModel!.totalPages!) {
            for (var element in searchPaginateModel!.items) {
              servicesList.add(ServicesModel.fromJson(element));
              if(!favorites.containsKey(element['id'])){
                favorites.addAll({element['id']: element['isFavourite']});
              }
            }
            servicesPageNumber++;
          }
        }
      }else{
        servicesSearchMessage = mainResponse.errorMessage;
      }
      getMainSectionServicesListLoading = false;
      emit(GetFeaturedMainSectionsServicesSuccess());
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
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



  void getServicesDetailsByItsId({required int id}) async{
    servicesModel = null;
    emit(GetServicesDetailsByItsIdLoadingState());
    try{
      final response = await ServicesProvidersRepository.getServicesDetailsById(id: id);
      mainResponse = MainResponse.fromJson(response.data);
      servicesModel = ServicesModel.fromJson(mainResponse.data);
      emit(GetServicesDetailsByItsIdSuccess());
    }catch(error){
      emit(GetServicesDetailsByItsIdError(error: error.toString()));
    }

  }

  void searchForServicesOfServicesProviderByItsId({
    String? searchName,
    int? mainSectionId,
  }) async {
    try {
      if (searchServicesPageNumber == 1) {
        searchPaginateModel =null;
        searchList = [];
        getMainSectionServicesListLoading = true;
        emit(GetFeaturedMainSectionsServicesLoadingState());
      }
      final response = await ServicesProvidersRepository.getServices(
        pageNumber: searchServicesPageNumber,
        pageSize: 15,
        searchName: searchName,
        mainSectionId: mainSectionId,
      );
      mainResponse = MainResponse.fromJson(response.data);
      if (mainResponse.errorCode == 0) {
        searchPaginateModel = PaginateModel.fromJson(mainResponse.data);
        if(searchPaginateModel!.items !=null){
          if (searchServicesPageNumber == 1) {
            for (var element in searchPaginateModel!.items) {
              searchList.add(ServicesModel.fromJson(element));
              if(!favorites.containsKey(element['id'])){
                favorites.addAll({element['id']: element['isFavourite']});
              }
            }
            searchServicesPageNumber++;
          } else if (searchServicesPageNumber <= searchPaginateModel!.totalPages!) {
            for (var element in searchPaginateModel!.items) {
              searchList.add(ServicesModel.fromJson(element));
              if(!favorites.containsKey(element['id'])){
                favorites.addAll({element['id']: element['isFavourite']});
              }
            }
            searchServicesPageNumber++;
          }
        }
      }else{
        servicesSearchMessage = mainResponse.errorMessage;
      }
      // print(searchPaginateModel!.totalPages);
      if (kDebugMode) {
        print(servicesSearchMessage);
      }
      getMainSectionServicesListLoading = false;
      emit(GetFeaturedMainSectionsServicesSuccess());
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(GetFeaturedMainSectionsServicesError(error: error.toString()));
    }
  }



  void addServicesProviderToFavorite({required int id})async{
    favorites[id] = !favorites[id]!;
    final response = await ServicesProvidersRepository.addServiceToFavorite(id: id);
    mainResponse = MainResponse.fromJson(response.data);
    if(mainResponse.errorCode == 0){
      emit(AddServiceToFavSuccess());
    }else{
      emit(AddServiceToFavError(error: mainResponse.errorMessage.toString()));
    }
  }

  void deleteServicesProviderToFavorite({required int id})async{
    favorites[id] = !favorites[id]!;
    final response = await ServicesProvidersRepository.deleteServiceFromFavorite(id: id);
    mainResponse = MainResponse.fromJson(response.data);
    if(mainResponse.errorCode == 0){
      emit(DeleteServiceFromFavSuccess());
    }else{
      emit(DeleteServiceFromFavError(error: mainResponse.errorMessage.toString()));
    }
  }
}
