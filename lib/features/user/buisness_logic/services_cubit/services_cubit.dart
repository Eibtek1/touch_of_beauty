import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touch_of_beauty/features/authentication/data/models/main_response.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_cubit/services_state.dart';
import 'package:touch_of_beauty/features/user/data/models/paginate_model.dart';
import 'package:touch_of_beauty/features/user/data/models/services_model.dart';
import 'package:touch_of_beauty/features/user/data/repository/services_providers_repository.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/network/dio_helper.dart';
import '../../../authentication/data/models/cities_model.dart';
import '../../data/models/address_model.dart';

class UserServicesCubit extends Cubit<UserServicesState> {
  UserServicesCubit() : super(UserServicesInitial());

  static UserServicesCubit get(context) => BlocProvider.of(context);

  late MainResponse mainResponse;

  PaginateModel? paginateModel;

  PaginateModel? searchPaginateModel;

  AddressModel? addressModel;

  int servicesPageNumber = 1;

  int searchServicesPageNumber = 1;

  String servicesSearchMessage ='';

  late CitiesModel citiesModel;

  ServicesModel? servicesModel;

  List<ServicesModel> servicesList = [];

  List<ServicesModel> searchList = [];

  List<ServicesModel> servicesByMainSectionAndServicesProviderList =[];

  Map<dynamic , bool> favorites = {} ;

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
  bool getServicesByMainSectionAndServicesProvidersIdLoading = false;
  int servicesCI = 0;
  int cityCI = 0;
  int cityId = 1;
  int addressCityId = 1;
  int arrangementCI = 0;
  int rattingCI = 0;
  PaginateModel? servicesByMainSectionAndServicesProviderPaginateModel;

  void changeButtonState({required void Function() onPressed}) {
    onPressed();
    emit(ChangeButtonState());
  }



  void onCityChanged(CitiesModel value) {
    citiesModel = value;
    emit(GetChangedCity());
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
    citiesModel = citiesList.first;
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
          pageSize: 3,
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
              if(!favorites.containsKey(element['id'])){
                favorites.addAll({element['id']: element['isFavourite']});
              }
            }
            servicesPageNumber++;
          } else if (servicesPageNumber <= paginateModel!.totalPages!) {
            for (var element in paginateModel!.items) {
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
      emit(GetServicesByServiceProviderIdSuccess());
    } catch (error) {

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
      emit(GetServicesByServiceProviderIdSuccess());
    } catch (error) {
      emit(GetServicesByServiceProviderIdError(error: error.toString()));
    }
  }



  void addServicesProviderToFavorite({required int id})async{
    favorites[id] = !favorites[id]!;
    emit(AddServiceToFavLoading());
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
    emit(DeleteServiceFromFavLoading());
    final response = await ServicesProvidersRepository.deleteServiceFromFavorite(id: id);
    mainResponse = MainResponse.fromJson(response.data);
    if(mainResponse.errorCode == 0){
      emit(DeleteServiceFromFavSuccess());
    }else{
      emit(DeleteServiceFromFavError(error: mainResponse.errorMessage.toString()));
    }
  }



  void getServicesByMainSectionAndServicesProvidersId({
    required String servicesProviderId,
    required int mainSectionId,
  }) async {
    try {
      getServicesByMainSectionAndServicesProvidersIdLoading = true;
      emit(GetServicesByMainSectionIdLoadingState());
      final response = await ServicesProvidersRepository.getServices(
        pageNumber: 1,
        pageSize: 3,
        servicesProviderId: servicesProviderId,
        mainSectionId: mainSectionId,
      );
      mainResponse = MainResponse.fromJson(response.data);
      if (mainResponse.errorCode == 0) {
        servicesByMainSectionAndServicesProviderPaginateModel = PaginateModel.fromJson(mainResponse.data);
        if(servicesByMainSectionAndServicesProviderPaginateModel!.items !=null){
          servicesByMainSectionAndServicesProviderList.clear();
          for (var element in servicesByMainSectionAndServicesProviderPaginateModel!.items) {
            servicesByMainSectionAndServicesProviderList.add(ServicesModel.fromJson(element));
            if(!favorites.containsKey(element['id'])){
              favorites.addAll({element['id']: element['isFavourite']});
            }
          }
        }
      }
      getServicesByMainSectionAndServicesProvidersIdLoading = false;
      emit(GetServicesByMainSectionIdSuccess());
    } catch (error) {
      emit(GetServicesByMainSectionIdError(error: error.toString()));
    }
  }

  int tabBarCIndex = 0;
  void changeTabBarCurrentIndex(int index,{ required String servicesProviderId,
    required int mainSectionId,}){
    tabBarCIndex = index;
    getServicesByMainSectionAndServicesProvidersId(servicesProviderId: servicesProviderId, mainSectionId: mainSectionId);
    emit(ChangedTabBarCurrentIndex());
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

  void addOrder({
    required int serviceId,
    required int addressId,
    required DateTime dateTime,
    required bool inHome,
  })async{
    try{
      emit(AddOrderLoading());
      final response = await ServicesProvidersRepository.addOrder(serviceId: serviceId, addressId: addressId, dateTime: dateTime, inHome: inHome);
      mainResponse = MainResponse.fromJson(response.data);
      if(mainResponse.errorCode == 0){
        emit(AddOrderSuccess());
      }
    }catch(error){
      emit(AddOrderError(error: error.toString()));
    }
  }



  void addAddress({
    required String region,
    required String street,
    required String buildingNumber,
    required String flatNumber,
    required String addressDetails,
  })async{
    try{
      emit(AddAddressLoading());
      final response = await ServicesProvidersRepository.addAddress(cityId: citiesModel.id!, region: region, street: street, buildingNumber: buildingNumber, flatNumber: flatNumber, addressDetails: addressDetails);
      mainResponse = MainResponse.fromJson(response.data);
      if(mainResponse.errorCode == 0){
        emit(AddAddressSuccess());
      }
    }catch(error){
      emit(AddAddressError(error: error.toString()));
    }
  }

  void deleteAddress({
  required int id,
  })async{
    try{
      emit(DeleteAddressLoading());
      final response = await ServicesProvidersRepository.deleteAddress(id: id);
      mainResponse = MainResponse.fromJson(response.data);
      if(mainResponse.errorCode == 0){
        emit(DeleteAddressSuccess());
      }
    }catch(error){
      emit(DeleteAddressError(error: error.toString()));
    }
  }

  List<AddressModel> addressList = [];
  void getAddress()async{
    try{
      emit(GetAddressLoading());
      final response = await ServicesProvidersRepository.getAddress();
      mainResponse = MainResponse.fromJson(response.data);
      if(mainResponse.errorCode == 0){
        addressList = [];
        for(var element in mainResponse.data){
          addressList.add(AddressModel.fromJson(element,mainResponse.data.indexOf(element)));
        }
      }
      emit(GetAddressSuccess());
    }catch(error){
      emit(GetAddressError(error: error.toString()));
    }
  }

}
