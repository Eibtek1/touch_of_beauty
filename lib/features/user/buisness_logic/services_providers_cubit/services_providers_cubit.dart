import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touch_of_beauty/features/authentication/data/models/main_response.dart';
import 'package:touch_of_beauty/features/user/data/models/paginate_model.dart';
import 'package:touch_of_beauty/features/user/data/repository/services_providers_repository.dart';
import '../../data/models/favorites_services_provider_model.dart';
import '../../data/models/services_providers_model.dart';
import '../../data/models/slider_model.dart';
import 'services_providers_state.dart';

class ServicesProvidersCubit extends Cubit<ServicesProvidersState> {
  ServicesProvidersCubit() : super(ServicesProvidersInitial());

  static ServicesProvidersCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  late MainResponse mainResponse;
  ServicesProviderModel? servicesProviderModel;
  PaginateModel? servicesProviderPaginateModel;
  PaginateModel? searchServicesProviderPaginateModel;
  PaginateModel? featuredServicesProviderPaginateModel;
  PaginateModel? servicesByMainSectionAndServicesProviderPaginateModel;
  Map<dynamic , bool> favorites = {} ;
  int servicesProviderPageNumber = 1;
  int searchServicesProviderPageNumber = 1;
  int featuredServicesProviderPageNumber = 1;
  int servicesByMainSectionAndServicesProviderPageNumber = 1;
  List<SliderModel> sliderPhotosList =[];
  List<ServicesProviderModel> servicesProvidersList =[];
  List<ServicesProviderModel> searchServicesProvidersList =[];
  List<ServicesProviderModel> featuredServicesProvidersList =[];
  List<FavoriteServicesProviderModel> favoritesServicesProvidersList =[];
  bool getSliderPhotosLoading = false;
  bool getFeaturedServicesProviderLoading = false;
  bool getFavoriteServicesProviderLoading = false;
  bool searchForServicesProviderLoading = false;
  String servicesProviderSearchMessage = '';
   void getFeaturedServicesProviders() async{
     if(featuredServicesProviderPageNumber == 1){
       featuredServicesProvidersList = [];
       getFeaturedServicesProviderLoading = true;
       emit(GetFeaturedServicesProvidersLoadingState());
     }
     try{
       final response = await ServicesProvidersRepository.getAllFeaturedServicesProviders(pageNumber: featuredServicesProviderPageNumber);
       mainResponse = MainResponse.fromJson(response.data);
       if (mainResponse.errorCode == 0) {
         featuredServicesProviderPaginateModel =
             PaginateModel.fromJson(mainResponse.data);
         if (featuredServicesProviderPageNumber == 1) {
           for (var element in featuredServicesProviderPaginateModel!.items) {
             featuredServicesProvidersList.add(ServicesProviderModel.fromJson(element));
             if(!favorites.containsKey(element['id'])){
               favorites.addAll({element['id']: element['isFavourite']});
             }
           }
           featuredServicesProviderPageNumber++;
         } else if (featuredServicesProviderPageNumber <=
             featuredServicesProviderPaginateModel!.totalPages!) {
           for (var element in featuredServicesProviderPaginateModel!.items) {
             featuredServicesProvidersList.add(ServicesProviderModel.fromJson(element));
             if(!favorites.containsKey(element['id'])){
               favorites.addAll({element['id']: element['isFavourite']});
             }
           }
           featuredServicesProviderPageNumber++;
         }
       }
       getFeaturedServicesProviderLoading = false;
       emit(GetFeaturedServicesProvidersSuccess());
     }catch(error){
       emit(GetFeaturedServicesProvidersError(error: error.toString()));
     }


   }

   void getAllServicesProviders() async{
     if(servicesProviderPageNumber == 1){
       servicesProvidersList = [];
       searchForServicesProviderLoading = true;
       emit(GetAllServicesProvidersLoadingState());
     }
     try{
       final response = await ServicesProvidersRepository.getAllServicesProviders(pageNumber: servicesProviderPageNumber);
       mainResponse = MainResponse.fromJson(response.data);
       if (mainResponse.errorCode == 0) {
         servicesProviderPaginateModel =
             PaginateModel.fromJson(mainResponse.data);
         if (servicesProviderPageNumber == 1) {
           for (var element in servicesProviderPaginateModel!.items) {
             servicesProvidersList.add(ServicesProviderModel.fromJson(element));
             if(!favorites.containsKey(element['id'])){
               favorites.addAll({element['id']: element['isFavourite']});
             }
           }
           servicesProviderPageNumber++;
         } else if (servicesProviderPageNumber <=
             servicesProviderPaginateModel!.totalPages!) {
           for (var element in servicesProviderPaginateModel!.items) {
             servicesProvidersList.add(ServicesProviderModel.fromJson(element));
             if(!favorites.containsKey(element['id'])){
               favorites.addAll({element['id']: element['isFavourite']});
             }
           }
           servicesProviderPageNumber++;
         }
       }
       searchForServicesProviderLoading = false;

       emit(GetAllServicesProvidersSuccess());
     }catch(error){
       searchForServicesProviderLoading = false;

       emit(GetAllServicesProvidersError(error: error.toString()));
     }

   }

   void getServicesProviderDataByItsId({required String id}) async{
     servicesProviderModel = null;
     emit(GetServicesProviderDetailsByItsIdLoadingState());
     try{
       final response = await ServicesProvidersRepository.getServicesProviderById(id: id);
       mainResponse = MainResponse.fromJson(response.data);
       servicesProviderModel = ServicesProviderModel.fromJson(mainResponse.data);
       emit(GetServicesProviderDetailsByItsIdSuccess());
     }catch(error){
       emit(GetServicesProviderDetailsByItsIdError(error: error.toString()));
     }

   }

   void getFavoriteServicesProviderDataByItsId({required String id}) async{
     servicesProviderModel = null;
     emit(GetFavoriteServicesProviderDetailsByItsIdLoadingState());
     try{
       final response = await ServicesProvidersRepository.getServicesProviderById(id: id);
       mainResponse = MainResponse.fromJson(response.data);
       servicesProviderModel = ServicesProviderModel.fromJson(mainResponse.data);
       emit(GetFavoriteServicesProviderDetailsByItsIdSuccess());
     }catch(error){
       emit(GetFavoriteServicesProviderDetailsByItsIdError(error: error.toString()));
     }

   }

   void getFeaturedServicesProviderDataByItsId({required String id}) async{
     servicesProviderModel = null;
     emit(GetFeaturedServicesProviderDetailsByItsIdLoadingState());
     try{
       final response = await ServicesProvidersRepository.getServicesProviderById(id: id);
       mainResponse = MainResponse.fromJson(response.data);
       servicesProviderModel = ServicesProviderModel.fromJson(mainResponse.data);
       emit(GetFeaturedServicesProviderDetailsByItsIdSuccess());
     }catch(error){
       emit(GetFeaturedServicesProviderDetailsByItsIdError(error: error.toString()));
     }

   }

  void addServicesProviderToFavorite({required String id})async{
     favorites[id] = !favorites[id]!;
     emit(AddServicesProviderToFavLoading());
     final response = await ServicesProvidersRepository.addServicesProviderToFavorite(id: id);
     mainResponse = MainResponse.fromJson(response.data);
     if(mainResponse.errorCode == 0){
       getFavoritesServicesProviders();
       emit(AddServicesProviderToFavSuccess());
     }else{
       emit(AddServicesProviderToFavError(error: mainResponse.errorMessage.toString()));
     }
   }

   void deleteServicesProviderToFavorite({required String id})async{
     favorites[id] = !favorites[id]!;
     favoritesServicesProvidersList.removeWhere((element) => element.providerId == id);
     emit(DeleteServicesProviderToFavLoading());
     final response = await ServicesProvidersRepository.deleteServicesProviderFromFavorite(id: id);
     mainResponse = MainResponse.fromJson(response.data);
     if(mainResponse.errorCode == 0){
       emit(DeleteServicesProviderToFavSuccess());
     }else{
       emit(DeleteServicesProviderToFavError(error: mainResponse.errorMessage.toString()));
     }
   }

  void getSliderPhotos() async{
    getSliderPhotosLoading = true;
    emit(GetSliderPhotosLoading());
    try{
      final response = await ServicesProvidersRepository.getSliderPhotos();
      mainResponse = MainResponse.fromJson(response.data);
      for(var element in mainResponse.data){
        sliderPhotosList.add(SliderModel.fromJson(element));
      }
      getSliderPhotosLoading = false;
      emit(GetSliderPhotosSuccess());
    }catch(error){
      emit(GetSliderPhotosError(error: error.toString()));
    }
  }



  void searchForServicesProvider({
    String? searchName,
  }) async {
    try {
      if (searchServicesProviderPageNumber == 1) {
        searchServicesProviderPaginateModel =null;
        searchServicesProvidersList = [];
        searchForServicesProviderLoading = true;
        emit(GetSearchServicesProvidersLoadingState());
      }
      final response = await ServicesProvidersRepository.getServices(
        pageNumber: searchServicesProviderPageNumber,
        pageSize: 15,
        searchName: searchName,
      );
      mainResponse = MainResponse.fromJson(response.data);
      if (mainResponse.errorCode == 0) {
        searchServicesProviderPaginateModel = PaginateModel.fromJson(mainResponse.data);
        if(searchServicesProviderPaginateModel!.items !=null){
          if (searchServicesProviderPageNumber == 1) {
            for (var element in searchServicesProviderPaginateModel!.items) {
              searchServicesProvidersList.add(ServicesProviderModel.fromJson(element));
              if(!favorites.containsKey(element['id'])){
                favorites.addAll({element['id']: element['isFavourite']});
              }
            }
            searchServicesProviderPageNumber++;
          } else if (searchServicesProviderPageNumber <= searchServicesProviderPaginateModel!.totalPages!) {
            for (var element in searchServicesProviderPaginateModel!.items) {
              searchServicesProvidersList.add(ServicesProviderModel.fromJson(element));
              if(!favorites.containsKey(element['id'])){
                favorites.addAll({element['id']: element['isFavourite']});
              }
            }
            searchServicesProviderPageNumber++;
          }
        }
      }else{
        servicesProviderSearchMessage = mainResponse.errorMessage;
      }

      searchForServicesProviderLoading = false;
      emit(GetSearchServicesProvidersSuccess());
    } catch (error) {
      searchForServicesProviderLoading = false;
      emit(GetSearchServicesProvidersError(error: error.toString()));
    }
  }


  void getFavoritesServicesProviders() async{
    getFavoriteServicesProviderLoading = true;
     emit(GetFavoritesServicesProvidersLoadingState());
    try{
      final response = await ServicesProvidersRepository.getFavoriteServiceProviders();
      mainResponse = MainResponse.fromJson(response.data);
      for(var element in mainResponse.data){
        if(!favoritesServicesProvidersList.contains(FavoriteServicesProviderModel.fromJson(element))){
          favoritesServicesProvidersList.add(FavoriteServicesProviderModel.fromJson(element));
        }
      }
      getFavoriteServicesProviderLoading = false;
      emit(GetFavoritesServicesProvidersSuccess());
    }catch(error){
      getFavoriteServicesProviderLoading = false;
      emit(GetFavoritesServicesProvidersError(error: error.toString()));
    }
  }
}
