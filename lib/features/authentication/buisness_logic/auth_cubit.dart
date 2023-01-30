import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/network/dio_helper.dart';
import '../data/models/cities_model.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);
  String? cityValue;
  int? cityId;
  List<CitiesModel> citiesList = [];
  List<String> citiesNamesList = [];

  void getCities() async {
    emit(GetCitiesLoading());
    final response = await DioHelper.getData(
        url: 'http://lightbulbtech-001-site13.etempurl.com/api/Cities');
    for (var element in response.data['data']) {
      citiesList.add(CitiesModel.fromJson(element));
    }
    for (var element in citiesList) {
      citiesNamesList.add(element.name!);
    }
    cityValue = citiesNamesList.first;
    emit(GetCitiesSuccess());
  }

  void onCityChanged(String value) {
    cityValue = value;
    for (var element in citiesList) {
      if (element.name == cityValue) {
        cityId = element.id;
      }
    }
    emit(GetChangedCity());
  }
}
