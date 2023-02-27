import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touch_of_beauty/features/authentication/data/models/main_response.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_cubit/services_state.dart';
import 'package:touch_of_beauty/features/user/data/models/paginate_model.dart';
import 'package:touch_of_beauty/features/user/data/models/services_model.dart';
import 'package:touch_of_beauty/features/user/data/repository/services_providers_repository.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/network/dio_helper.dart';
import '../../../authentication/data/models/cities_model.dart';

class UserServicesCubit extends Cubit<UserServicesState> {
  UserServicesCubit() : super(UserServicesInitial());

  static UserServicesCubit get(context) {
    return BlocProvider.of(context);
  }

  late MainResponse mainResponse;
  PaginateModel? paginateModel;
  PaginateModel? searchPaginateModel;
  int servicesPageNumber = 1;
  int searchServicesPageNumber = 1;
  String servicesSearchMessage ='';
  List<ServicesModel> servicesList = [];
  List<ServicesModel> searchList = [];
  List<CitiesModel> citiesList = [];
  final List<String> titleType = [
    'صالونات',
    'أفراد',
    'الكل',
  ];

  final List<String> arrangement = [
    'الأحدث',
    'الاقدم',
  ];

  bool inHome = true;
  bool inCenter = true;
  int servicesCI = 0;
  int cityCI = 0;
  int cityId = 1;
  int arrangementCI = 0;
  int rattingCI = 0;

  void changeButtonState({required void Function() onPressed}) {
    onPressed();
    emit(ChangeButtonState());
  }

  void getCities() async {
    emit(GetCitiesLoading());
    final response = await DioHelper.getData(
        url: 'http://lightbulbtech-001-site13.etempurl.com/api/Cities',
        bearerToken: token);
    citiesList.clear();
    for (var element in response.data['data']) {
      citiesList.add(CitiesModel.fromJson(element));
    }
    if (kDebugMode) {
      print(response);
    }
    emit(GetCitiesSuccess());
  }

  void getServicesByServiceProviderId({
     int? cityId,
     int? mainSectionId,
     int? serviceTypeDto,
     int? maxPrice,
     int? minPrice,
     String? servicesProviderName,
     String? servicesProviderId,
     String? searchName,
     bool? inHome,
     bool? inCenter,
     bool? orderFromNew,
  }) async {
    try {
      if (servicesPageNumber == 1) {
        paginateModel =null;
        servicesList = [];
        emit(GetServicesByServiceProviderIdLoading());
      }
      final response = await ServicesProvidersRepository.getServices(
          pageNumber: servicesPageNumber,
          pageSize: 15,
          cityId: cityId,
          mainSectionId: mainSectionId,
          serviceTypeDto: serviceTypeDto,
          maxPrice: maxPrice,
          minPrice: minPrice,
          servicesProviderName: servicesProviderName,
          servicesProviderId: servicesProviderId,
          searchName: searchName,
          inHome: inHome,
          inCenter: inCenter,
          orderFromNew: orderFromNew);
      mainResponse = MainResponse.fromJson(response.data);
      if (mainResponse.errorCode == 0) {
        paginateModel = PaginateModel.fromJson(mainResponse.data);
        if(paginateModel!.items !=null){
          if (servicesPageNumber == 1) {
            for (var element in paginateModel!.items) {
              servicesList.add(ServicesModel.fromJson(element));
            }
            servicesPageNumber++;
          } else if (servicesPageNumber <= paginateModel!.totalPages!) {
            for (var element in paginateModel!.items) {
              servicesList.add(ServicesModel.fromJson(element));
            }
            servicesPageNumber++;
          }
        }
      }else{
        servicesSearchMessage = mainResponse.errorMessage;
      }
      print(paginateModel!.totalPages);
      if (kDebugMode) {
        print(servicesSearchMessage);
      }
      emit(GetServicesByServiceProviderIdSuccess());
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(GetServicesByServiceProviderIdError(error: error.toString()));
    }
  }

  void searchForServicesOfServicesProviderByItsId({
     String? servicesProviderId,
     String? searchName,
  }) async {
    try {
      if (searchServicesPageNumber == 1) {
        searchPaginateModel =null;
        searchList = [];
        emit(GetServicesByServiceProviderIdLoading());
      }
      final response = await ServicesProvidersRepository.getServices(
          pageNumber: searchServicesPageNumber,
          pageSize: 15,
          servicesProviderId: servicesProviderId,
          searchName: searchName,
          );
      mainResponse = MainResponse.fromJson(response.data);
      if (mainResponse.errorCode == 0) {
        searchPaginateModel = PaginateModel.fromJson(mainResponse.data);
        if(searchPaginateModel!.items !=null){
          if (searchServicesPageNumber == 1) {
            for (var element in searchPaginateModel!.items) {
              searchList.add(ServicesModel.fromJson(element));
            }
            searchServicesPageNumber++;
          } else if (searchServicesPageNumber <= searchPaginateModel!.totalPages!) {
            for (var element in searchPaginateModel!.items) {
              searchList.add(ServicesModel.fromJson(element));
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
      emit(GetServicesByServiceProviderIdSuccess());
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(GetServicesByServiceProviderIdError(error: error.toString()));
    }
  }
}
