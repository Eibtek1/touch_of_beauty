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
  late PaginateModel paginateModel;
  int servicesPageNumber = 1;
  List<ServicesModel> servicesList = [];
  List<CitiesModel> citiesList = [];
  bool inHome = true;
  bool inCenter = true;
  int servicesCI = 0;

  int cityCI = 0;

  int arrangementCI = 0;

  int rattingCI = 0;

  void changeButtonState({required void Function() onPressed}){
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
    emit(GetCitiesSuccess());
  }

  void changeServicesInHomeOrInCenter({required bool value}) {
    value = !value;
    emit(ChangeServicesInHomeOrInCenter());
  }

  void getServicesByServiceProviderId({required String id}) async {
    try {
      if (servicesPageNumber == 1) {
        servicesList = [];
        emit(GetServicesByServiceProviderIdLoading());
      }
      final response =
          await ServicesProvidersRepository.getServicesByServiceProviderId(
              id: id);
      mainResponse = MainResponse.fromJson(response.data);
      paginateModel = PaginateModel.fromJson(mainResponse.data);
      if (mainResponse.errorCode == 0) {
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
      }
      emit(GetServicesByServiceProviderIdSuccess());
    } catch (error) {
      emit(GetServicesByServiceProviderIdError(error: error.toString()));
    }
  }

  void getServicesInHomeOrInCenter() async {
    emit(GetServicesInHomeOrCenterLoading());
    try {
      final response =
          await ServicesProvidersRepository.getServicesInHomeOrInCenter(
              inHome: inHome);
      print(response.data);
    } catch (error) {
      print(error.toString());
    }
  }
}
