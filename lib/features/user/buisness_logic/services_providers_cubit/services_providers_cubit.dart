import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touch_of_beauty/features/authentication/data/models/main_response.dart';
import 'package:touch_of_beauty/features/user/data/repository/services_providers_repository.dart';
import '../../data/models/services_providers_model.dart';
import '../../data/models/slider_model.dart';
import 'services_providers_state.dart';

class ServicesProvidersCubit extends Cubit<ServicesProvidersState> {
  ServicesProvidersCubit() : super(ServicesProvidersInitial());

  static ServicesProvidersCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  late MainResponse mainResponse;
  GetServicesProviderModel? getServicesProviderModel;

  List<SliderModel> sliderPhotosList =[];
  bool getSliderPhotosLoading = false;
   void getFeaturedServicesProviders() async{
     emit(GetFeaturedServicesProvidersLoadingState());
     try{
       final response = await ServicesProvidersRepository.getAllFeaturedServicesProviders();
       mainResponse = MainResponse.fromJson(response.data);

       emit(GetFeaturedServicesProvidersSuccess());
     }catch(error){
       emit(GetFeaturedServicesProvidersError(error: error.toString()));
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

   void getAllServicesProviders() async{
     getServicesProviderModel = null;
     emit(GetAllServicesProvidersLoadingState());
     try{
       final response = await ServicesProvidersRepository.getAllServicesProviders();
       mainResponse = MainResponse.fromJson(response.data);
       getServicesProviderModel = GetServicesProviderModel.fromJson(mainResponse.data);
       emit(GetAllServicesProvidersSuccess());
     }catch(error){
       emit(GetAllServicesProvidersError(error: error.toString()));
     }

   }
}
