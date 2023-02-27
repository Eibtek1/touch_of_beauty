import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:touch_of_beauty/features/authentication/data/models/main_response.dart';
import 'package:touch_of_beauty/features/user/data/models/paginate_model.dart';
import 'package:touch_of_beauty/features/user/data/models/services_model.dart';
import 'package:touch_of_beauty/features/vendor/buisness_logic/services_cubit/vendor_services_state.dart';

import '../../../user/data/models/main_sections_model.dart';
import '../../data/repository/services_repo.dart';

class VendorServicesCubit extends Cubit<VendorServicesState> {
  VendorServicesCubit() : super(VendorServicesInitial());
  static VendorServicesCubit get(context) {
    return BlocProvider.of(context);
  }

  late MainResponse mainResponse;
  late PaginateModel paginateModel;
  int servicesPageNumber = 1;
  List<ServicesModel> servicesList =[];
  File? servicesImage;
  ImagePicker picker = ImagePicker();
  List<MainSectionsModel> mainSectionsFeaturedList = [];

  bool inCenter = false;
  bool inHome = false;
  bool isAvailable = false;

  void changeButtonState({required void Function() onPressed}) {
    onPressed();
    emit(ChangeButtonState());
  }
  Future<void> getImagePick() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      servicesImage = File(pickedFile.path);
      emit(GetPickedImageSuccessState());
    } else {
      emit(GetPickedImageErrorState());
    }
  }
  void getServicesByServiceProviderId() async{
    try{
      if(servicesPageNumber == 1){
        servicesList = [];
        emit(GetServicesByServiceProviderIdLoading());
      }
      final response = await VendorServicesRepository.getServicesByServiceProviderId( pageNumber: servicesPageNumber);
      mainResponse = MainResponse.fromJson(response.data);
      paginateModel = PaginateModel.fromJson(mainResponse.data);
      print(mainResponse.data);
      if(mainResponse.errorCode == 0){
        if(servicesPageNumber == 1){
          for(var element in paginateModel.items){
            servicesList.add(ServicesModel.fromJson(element));
          }
          servicesPageNumber++;
        }else if(servicesPageNumber<=paginateModel.totalPages!){
          for(var element in paginateModel.items){
            servicesList.add(ServicesModel.fromJson(element));
          }
          servicesPageNumber++;
        }

      }
      emit(GetServicesByServiceProviderIdSuccess());
    }catch(error){
      emit(GetServicesByServiceProviderIdError(error: error.toString()));
    }

  }

  void getFeaturedMainSections() async{
    emit(GetMainSectionsLoadingState());
    try{
      final response = await VendorServicesRepository.getFeaturedMainSections();
      mainResponse = MainResponse.fromJson(response.data);
      mainSectionsFeaturedList = [];
      for(var element in mainResponse.data){
        mainSectionsFeaturedList.add(MainSectionsModel.fromJson(element));
      }
      emit(GetMainSectionsSuccess());
    }catch(error){
      emit(GetMainSectionsError(error: error.toString()));
    }

  }


}
