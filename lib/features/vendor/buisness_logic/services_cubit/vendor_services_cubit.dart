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
  String errorMessage = '';
  List<ServicesModel> servicesList = [];
  File? servicesImage;
  ImagePicker picker = ImagePicker();
  List<MainSectionsModel> mainSectionsFeaturedList = [];
  bool inCenter = false;
  bool inHome = false;
  bool isAvailable = false;
  String? mainSectionValue;
  int mainSectionId = 1;

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

  void getServicesByServiceProviderId() async {
    try {
      if (servicesPageNumber == 1) {
        servicesList = [];
        emit(GetServicesByServiceProviderIdLoading());
      }
      final response =
          await VendorServicesRepository.getServicesByServiceProviderId(
              pageNumber: servicesPageNumber);
      mainResponse = MainResponse.fromJson(response.data);
      if (mainResponse.errorCode == 0) {
        paginateModel = PaginateModel.fromJson(mainResponse.data);
        if (servicesPageNumber == 1) {
          for (var element in paginateModel.items) {
            servicesList.add(ServicesModel.fromJson(element));
          }
          servicesPageNumber++;
        } else if (servicesPageNumber <= paginateModel.totalPages!) {
          for (var element in paginateModel.items) {
            servicesList.add(ServicesModel.fromJson(element));
          }
          servicesPageNumber++;
        }
      } else if (mainResponse.errorCode != 0) {
        errorMessage = mainResponse.errorMessage;
      }
      emit(GetServicesByServiceProviderIdSuccess());
    } catch (error) {
      emit(GetServicesByServiceProviderIdError(error: error.toString()));
    }
  }

  void getMainSections() async {
    mainSectionValue = null;
    emit(GetMainSectionsLoadingState());
    try {
      final response = await VendorServicesRepository.getMainSections();
      mainResponse = MainResponse.fromJson(response.data);
      mainSectionsFeaturedList.clear();
      for (var element in mainResponse.data) {
        mainSectionsFeaturedList.add(MainSectionsModel.fromJson(element));
      }
      mainSectionValue = mainSectionsFeaturedList.first.title!;
      emit(GetMainSectionsSuccess());
    } catch (error) {
      emit(GetMainSectionsError(error: error.toString()));
    }
  }

  void onMainSectionChanged(dynamic value) {
    mainSectionValue = value;
    for (var element in mainSectionsFeaturedList) {
      if (element.title == mainSectionValue) {
        mainSectionId = element.id!;
      }
    }
    emit(GetChangedMainSectionId());
  }

  void addServices({
    required String titleAr,
    required String titleEn,
    required String description,
    required double price,
    required double finalPrice,
    required int empNumber,
    required String duration,
  }) async {
    emit(AddServicesLoading());
    try {
      await VendorServicesRepository.addServices(
        titleAr: titleAr,
        titleEn: titleEn,
        description: description,
        image: servicesImage,
        price: price,
        finalPrice: finalPrice,
        empNumber: empNumber,
        duration: duration,
        mainSectionId: mainSectionId,
        inHome: inHome,
        inCenter: inCenter,
        isAvailable: isAvailable,
      );
      emit(AddServicesSuccess());
    } catch (error) {
      emit(AddServicesError(error: error.toString()));
    }
  }

  void addEmployee({
    required String name,
    required String email,
    required String phoneNumber,
    required File? image,
  })async{
    try{
      emit(AddEmployeeLoading());
      final response = await VendorServicesRepository.addEmployee(name: name, email: email, phoneNumber: phoneNumber, image: image);
      mainResponse = MainResponse.fromJson(response.data);
      if(mainResponse.errorCode == 0){
        emit(AddEmployeeSuccess());
      }
    }catch(error){
      emit(AddEmployeeError(error: error.toString()));
    }
  }

  void deleteEmployee({
    required int id,
  })async{
    try{
      emit(DeleteEmployeeLoading());
      final response = await VendorServicesRepository.deleteEmployee(id: id);
      mainResponse = MainResponse.fromJson(response.data);
      if(mainResponse.errorCode == 0){
        emit(DeleteEmployeeSuccess());
      }
    }catch(error){
      emit(DeleteEmployeeError(error: error.toString()));
    }
  }

  void getEmployee({
    required int id,
  })async{
    try{
      emit(GetEmployeeLoading());
      final response = await VendorServicesRepository.getEmployees();
      mainResponse = MainResponse.fromJson(response.data);
      if(mainResponse.errorCode == 0){
        emit(GetEmployeeSuccess());
      }
    }catch(error){
      emit(GetEmployeeError(error: error.toString()));
    }
  }
}
