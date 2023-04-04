
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../authentication/data/models/main_response.dart';
import '../../../user/data/models/paginate_model.dart';
import '../../../user/data/models/services_model.dart';
import '../../../user/data/repository/services_providers_repository.dart';
import 'freelancer_services_state.dart';
import '../../../freelancer/data/repository/freelancer_services.dart';
class FreelancerServicesCubit extends Cubit<FreelancerServicesState> {
  FreelancerServicesCubit() : super(FreelancerServicesInitial());

  static FreelancerServicesCubit get(context) =>BlocProvider.of(context);
  int servicesPageNumber = 1;
  List<ServicesModel> servicesList = [];
  late MainResponse mainResponse;
  late PaginateModel paginateModel;
  String errorMessage = '';
  bool inCenter = false;
  bool inHome = false;
  bool isAvailable = false;
  String? mainSectionValue;
  ServicesDetailsModel? servicesModel;

  void getServicesByServiceProviderId() async {
    try {
      if (servicesPageNumber == 1) {
        servicesList = [];
        emit(GetServicesByServiceProviderIdLoading());
      }
      final response =
      await FreelancerServicesRepository.getServicesByServiceProviderId(
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


  void getServicesDetailsByItsId({required int id}) async {
    servicesModel = null;
    emit(GetServicesDetailsByItsIdLoadingState());
    try {
      final response =
      await ServicesProvidersRepository.getServicesDetailsById(id: id);
      mainResponse = MainResponse.fromJson(response.data);
      servicesModel = ServicesDetailsModel.fromJson(mainResponse.data);
      print(servicesModel!.imgUrl!);
      emit(GetServicesDetailsByItsIdSuccess());
    } catch (error) {
      emit(GetServicesDetailsByItsIdError(error: error.toString()));
    }
  }

}
