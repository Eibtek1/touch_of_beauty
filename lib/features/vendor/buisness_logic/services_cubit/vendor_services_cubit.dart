import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touch_of_beauty/features/authentication/data/models/main_response.dart';
import 'package:touch_of_beauty/features/user/data/models/paginate_model.dart';
import 'package:touch_of_beauty/features/user/data/models/services_model.dart';
import 'package:touch_of_beauty/features/user/data/repository/services_providers_repository.dart';
import 'package:touch_of_beauty/features/vendor/buisness_logic/services_cubit/vendor_services_state.dart';

class VendorServicesCubit extends Cubit<VendorServicesState> {
  VendorServicesCubit() : super(VendorServicesInitial());
  static VendorServicesCubit get(context) {
    return BlocProvider.of(context);
  }

  late MainResponse mainResponse;
  late PaginateModel paginateModel;
  int servicesPageNumber = 1;
  List<ServicesModel> servicesList =[];
  bool inHome = true;
  void changeServicesInHomeOrInCenter({required int inHomeZero}){
    if(inHomeZero == 0){
      inHome = true;
      emit(ChangeServicesInHomeOrInCenter());
      getServicesInHomeOrInCenter();
    }else{
      inHome = false;
      emit(ChangeServicesInHomeOrInCenter());
      getServicesInHomeOrInCenter();
    }
  }
  void getServicesByServiceProviderId({required String id}) async{
    try{
      if(servicesPageNumber == 1){
        servicesList = [];
        emit(GetServicesByServiceProviderIdLoading());
      }
      final response = await ServicesProvidersRepository.getServicesByServiceProviderId(id: id);
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
  void getServicesInHomeOrInCenter() async{
    emit(GetServicesInHomeOrCenterLoading());
    try{
      final response = await ServicesProvidersRepository.getServicesInHomeOrInCenter(inHome: inHome);
      print(response.data);
    }catch(error){
      print(error.toString());
    }

  }



}
