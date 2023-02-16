import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touch_of_beauty/core/constants/constants.dart';
import 'package:touch_of_beauty/features/authentication/data/repository/auth_repository.dart';
import '../../../core/network/dio_helper.dart';
import '../data/models/cities_model.dart';
import '../data/models/confirm_register_model.dart';
import '../data/models/get_user_data_model.dart';
import '../data/models/login_model.dart';
import '../data/models/main_response.dart';
import '../data/models/register_model.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);
  String? cityValue;
  int cityId = 1;
  List<CitiesModel> citiesList = [];
  List<String> citiesNamesList = [];
  late MainResponse mainResponse;
  ImagePicker picker = ImagePicker();
  File? profileImage;
  File? freelancerImage;
  String? message;
  GetUserModel? getUserModel;

  void getCities() async {
    emit(GetCitiesLoading());
    final response = await DioHelper.getData(
        url: 'http://lightbulbtech-001-site13.etempurl.com/api/Cities', bearerToken: token);
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
        cityId = element.id!;
      }
    }
    emit(GetChangedCity());
  }

  Future<void> getImagePick() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(GetPickedImageSuccessState());
    } else {
      emit(GetPickedImageErrorState());
    }
  }

  Future<void> getFreelanceImagePick() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      freelancerImage = File(pickedFile.path);
      emit(GetPickedImageSuccessState());
    } else {
      emit(GetPickedImageErrorState());
    }
  }

  void login({
    required String phone,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      final response = await AuthRepository.login(phone: phone, password: password);
      mainResponse = MainResponse.fromJson(response.data);
      message = mainResponse.errorMessage.toString();
      print(mainResponse.data);
          if(mainResponse.errorCode == 0){
        emit(LoginSuccess(loginModel: LoginModel.fromJson(mainResponse.data)));
      }else{
            emit(LoginSuccessButErrorInData(errorMessage: message!));
          }
    } catch (error) {
      print(error.toString());
      emit(LoginError(error: error.toString()));
    }
  }

  void userRegister({
    required String userName,
    required String password,
    required String email,
    required String phone,
  }) async {
    emit(RegisterLoading());
    try{
      final response = await AuthRepository.userRegister(
        userName: userName,
        password: password,
        email: email,
        phone: phone,
        cityId: cityId,
        image: profileImage,
      );
      mainResponse = MainResponse.fromJson(response.data);
      message = mainResponse.errorMessage.toString();
      emit(RegisterSuccess(RegisterModel.fromJson(mainResponse.data)));
    }catch(error){
      emit(RegisterError(error.toString()));
    }
  }

  void vendorRegister({
    required String userName,
    required String password,
    required String email,
    required String description,
    required String phone,
  }) async {
    emit(RegisterLoading());
    try{
      final response = await AuthRepository.vendorRegister(
        userName: userName,
        password: password,
        email: email,
        description: description,
        phone: phone,
        cityId: cityId,
        image: profileImage,
      );
      mainResponse = MainResponse.fromJson(response.data);
      message = mainResponse.errorMessage.toString();
      emit(RegisterSuccess(RegisterModel.fromJson(mainResponse.data)));
    }catch(error){
      emit(RegisterError(error.toString()));
    }

  }

  void freelancerRegister({
    required String userName,
    required String password,
    required String email,
    required String description,
    required String phone,
  }) async {
    emit(RegisterLoading());
    try{
      final response = await AuthRepository.freelancerRegister(
        userName: userName,
        password: password,
        email: email,
        description: description,
        phone: phone,
        cityId: cityId,
        freelancerImage: freelancerImage,
        image: profileImage,
      );
      mainResponse = MainResponse.fromJson(response.data);
      message = mainResponse.errorMessage.toString();
      emit(RegisterSuccess(RegisterModel.fromJson(mainResponse.data)));
    }catch(error){
      emit(RegisterError(error.toString()));
    }
  }

  void confirmRegister({
    required String phone,
    required String randomCode,
  }) async {
    emit(ConfirmRegisterLoading());
    try{
      final response = await AuthRepository.confirmRegister(
        phone: phone,
        randomCode: randomCode,
      );
      mainResponse = MainResponse.fromJson(response.data);
      message = mainResponse.errorMessage.toString();
      emit(ConfirmRegisterSuccess(ConfirmRegisterModel.fromJson(mainResponse.data)));
    }catch(error){
      emit(ConfirmRegisterError(error.toString()));
    }
  }


  void getUserData() async {
    emit(GetUserDataLoading());
    try{
      final response = await AuthRepository.getUserData();
      mainResponse = MainResponse.fromJson(response.data);
      message = mainResponse.errorMessage.toString();
      getUserModel = GetUserModel.fromJson(mainResponse.data);
      print(mainResponse.data);
      emit(GetUserDataSuccess());
    }catch(error){
      print(error.toString());
      emit(GetUserDataError(error.toString()));
    }
  }


}
