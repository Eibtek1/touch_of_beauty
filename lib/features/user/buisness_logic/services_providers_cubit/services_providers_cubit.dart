import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touch_of_beauty/features/authentication/data/models/main_response.dart';
import 'package:touch_of_beauty/features/user/data/repository/services_providers_repository.dart';
import '../../data/models/main_sections_model.dart';
import 'services_providers_state.dart';

class ServicesProvidersCubit extends Cubit<ServicesProvidersState> {
  ServicesProvidersCubit() : super(ServicesProvidersInitial());

  static ServicesProvidersCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  late MainResponse mainResponse;
  List<MainSectionsModel> mainSectionsFeaturedList = [];

   void getFeaturedMainSections() async{
     emit(GetFeaturedMainSectionsLoadingState());
     try{
       final response = await ServicesProvidersRepository.getFeaturedMainSections();
       mainResponse = MainResponse.fromJson(response.data);
       for(var element in mainResponse.data){
         mainSectionsFeaturedList.add(MainSectionsModel.fromJson(element));
       }
     }catch(error){
       emit(GetFeaturedMainSectionsError(error: error.toString()));
     }

   }

   void getFeaturedServicesProviders() async{
     emit(GetFeaturedMainSectionsLoadingState());
     try{
       final response = await ServicesProvidersRepository.getAllFeaturedServicesProviders();
       mainResponse = MainResponse.fromJson(response.data);
       emit(GetFeaturedServicesProvidersSuccess());
     }catch(error){
       emit(GetFeaturedServicesProvidersError(error: error.toString()));
     }

   }
}
