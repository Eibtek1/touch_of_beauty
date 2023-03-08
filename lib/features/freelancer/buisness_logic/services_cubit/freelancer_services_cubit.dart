
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../authentication/data/models/main_response.dart';
import '../../../user/data/models/paginate_model.dart';
import '../../../user/data/models/services_model.dart';
import 'freelancer_services_state.dart';
import '../../../freelancer/data/repository/freelancer_services.dart';
class FreelancerServicesCubit extends Cubit<FreelancerServicesState> {
  FreelancerServicesCubit() : super(FreelancerServicesInitial());
  int servicesPageNumber = 1;
  List<ServicesModel> servicesList = [];

  late MainResponse mainResponse;
  late PaginateModel paginateModel;
  String errorMessage = '';


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
}
