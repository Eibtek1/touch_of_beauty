import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touch_of_beauty/core/cache_manager/cache_keys.dart';
import 'package:touch_of_beauty/core/cache_manager/shared_preferences.dart';
import 'package:touch_of_beauty/core/constants/constants.dart';
import 'package:touch_of_beauty/features/authentication/data/repository/auth_repository.dart';
import '../../../core/network/api_end_points.dart';
import '../../../core/network/dio_helper.dart';
import '../../vendor/data/models/pictures_model.dart';
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

  List<CitiesModel> citiesList = [];
  List<PicturesModel> picturesList = [];
  Map<String, dynamic> picturesMap = {};
  late MainResponse mainResponse;
  int data = 0;
  ImagePicker picker = ImagePicker();
  File? profileImage;
  File? freelancerImage;
  String? message;
  GetUserModel? getUserModel;
  late CitiesModel citiesModel;

  void onCityChanged(CitiesModel value) {
    citiesModel = value;
    emit(GetChangedCity());
  }

  void getCities() async {
    emit(GetCitiesLoading());
    final response = await DioHelper.getData(
        url: '${EndPoints.baseUrl}/Cities',
        bearerToken: token);
    citiesList.clear();
    for (var element in response.data['data']) {
      citiesList.add(CitiesModel.fromJson(element));
    }
    citiesModel = citiesList.first;
    emit(GetCitiesSuccess());
  }

  Future<void> getImagePick() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(GetProfilePickedImageSuccessState());
    } else {
      emit(GetPickedImageErrorState());
    }
  }

  Future<void> getPictureLibraryImagePick() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(GetPictureLibraryPickedSuccessState());
    } else {
      emit(GetPictureLibraryPickedErrorState());
    }
  }

  Future<void> getFreelanceImagePick() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      freelancerImage = File(pickedFile.path);
      emit(GetFreelanceImagePickedSuccessState());
    } else {
      emit(GetFreelanceImagePickedErrorState());
    }
  }

  void login({
    required String phone,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      final response =
          await AuthRepository.login(phone: phone, password: password);
      mainResponse = MainResponse.fromJson(response.data);
      message = mainResponse.errorMessage.toString();
      if (mainResponse.errorCode == 0) {
        emit(LoginSuccess(loginModel: LoginModel.fromJson(mainResponse.data)));
      } else {
        emit(LoginSuccessButErrorInData(errorMessage: message!));
      }
    } catch (error) {
      emit(LoginError(error: error.toString()));
    }
  }

  void logout() async {
    emit(LogoutLoading());
    try {
      await AuthRepository.logout();
      token = null;
      userType = null;
      profileImage = null;
      freelancerImage = null;
      message = null;
      getUserModel = null;
      citiesList = [];
      picturesList = [];
      picturesMap = {};
      await CacheHelper.removeData(key: CacheKeys.token);
      await CacheHelper.removeData(key: CacheKeys.userType);
      emit(LogoutSuccess());
    } catch (error) {
      emit(LogoutError(error.toString()));
    }
  }

  void deleteUserAccount() async {
    emit(DeleteAccountLoading());
    try {
      final response = await AuthRepository.deleteUserAccount();
      mainResponse = MainResponse.fromJson(response.data);
      print(response);
      emit(DeleteAccountSuccess(mainResponse.errorMessage));
    } catch (error) {
      emit(DeleteAccountError(error.toString()));
    }
  }

  void userRegister({
    required String userName,
    required String password,
    required String email,
    required String phone,
  }) async {
    emit(RegisterLoading());
    try {
      final response = await AuthRepository.userRegister(
        userName: userName,
        password: password,
        email: email,
        phone: phone,
        cityId: citiesModel.id,
        image: profileImage,
      );
      mainResponse = MainResponse.fromJson(response.data);
      if(mainResponse.errorCode == 0){
        message = mainResponse.errorMessage.toString();
        profileImage = null;
        emit(RegisterSuccess(RegisterModel.fromJson(mainResponse.data)));
      }else{
        message = mainResponse.errorMessage.toString();
        emit(RegisterErrorInData(message!));
      }

    } catch (error) {
      emit(RegisterError(error.toString()));
    }
  }

  void vendorRegister({
    required String userName,
    required String password,
    required String email,
    required String description,
    required String phone,
    required String taxNumber,
  }) async {
    emit(RegisterLoading());
    try {
      final response = await AuthRepository.vendorRegister(
        userName: userName,
        password: password,
        email: email,
        description: description,
        phone: phone,
        cityId: citiesModel.id,
        image: profileImage,
        taxNumber: taxNumber,
      );
      mainResponse = MainResponse.fromJson(response.data);
      if(mainResponse.errorCode == 0){
        message = mainResponse.errorMessage.toString();
        profileImage = null;
        emit(RegisterSuccess(RegisterModel.fromJson(mainResponse.data)));
      }else{
        message = mainResponse.errorMessage.toString();
        emit(RegisterErrorInData(message!));
      }
    } catch (error) {
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
    try {
      final response = await AuthRepository.freelancerRegister(
        userName: userName,
        password: password,
        email: email,
        description: description,
        phone: phone,
        cityId: citiesModel.id,
        freelancerImage: freelancerImage,
        image: profileImage,
      );
      mainResponse = MainResponse.fromJson(response.data);
      if(mainResponse.errorCode == 0){
        message = mainResponse.errorMessage.toString();
        profileImage = null;
        emit(RegisterSuccess(RegisterModel.fromJson(mainResponse.data)));
      }else{
        message = mainResponse.errorMessage.toString();
        emit(RegisterErrorInData(message!));
      }
    } catch (error) {
      emit(RegisterError(error.toString()));
    }
  }

  void confirmRegister({
    required String phone,
    required String randomCode,
  }) async {
    emit(ConfirmRegisterLoading());
    try {
      final response = await AuthRepository.confirmRegister(
        phone: phone,
        randomCode: randomCode,
      );
      mainResponse = MainResponse.fromJson(response.data);
      message = mainResponse.errorMessage.toString();
      emit(ConfirmRegisterSuccess(
          ConfirmRegisterModel.fromJson(mainResponse.data)));
    } catch (error) {
      emit(ConfirmRegisterError(error.toString()));
    }
  }

  void confirmPassword({
    required String phone,
    required String randomCode,
  }) async {
    emit(ConfirmForgetPasswordLoading());
    try {
      final response = await AuthRepository.confirmForgetPassword(
        phone: phone,
        randomCode: randomCode,
      );
      mainResponse = MainResponse.fromJson(response.data);
      message = mainResponse.errorMessage.toString();
      emit(ConfirmForgetPasswordSuccess(LoginModel.fromJson(mainResponse.data)));
    } catch (error) {
      emit(ConfirmForgetPasswordError(error.toString()));
    }
  }

  void changeConfirmPassword({
    required String password,
  }) async {
    emit(ChangeConfirmForgetPasswordLoading());
    try {
      final response = await AuthRepository.changeForgetPassword(password: password, );
      mainResponse = MainResponse.fromJson(response.data);
      message = mainResponse.errorMessage.toString();
      emit(ChangeConfirmForgetPasswordSuccess(mainResponse));
    } catch (error) {
      emit(ChangeConfirmForgetPasswordError(error.toString()));
    }
  }

  void getUserData() async {
    emit(GetUserDataLoading());
    try {
      final response = await AuthRepository.getUserData();
      mainResponse = MainResponse.fromJson(response.data);
      message = mainResponse.errorMessage.toString();
      getUserModel = GetUserModel.fromJson(mainResponse.data);
      if (picturesList.isEmpty && data == 0) {
        getAllPicturesForProvider();
        // getAllPicturesForProvider();
      }
      emit(GetUserDataSuccess());
    } catch (error) {
      emit(GetUserDataError(error.toString()));
    }
  }

  void getAllPicturesForProvider() async {
    emit(GetPicturesForProviderLoading());
    try {
      final response = await AuthRepository.getAllPicturesForProvider();
      mainResponse = MainResponse.fromJson(response.data);
      if (mainResponse.errorCode == 0) {
        for (var element in mainResponse.data) {

          if (!picturesList.contains(PicturesModel.fromJson(element))) {
            picturesList.add(PicturesModel.fromJson(element));
          }
        }
      } else {
        data = mainResponse.errorCode;
      }
      emit(GetPicturesForProviderSuccess());
    } catch (error) {
      emit(GetPicturesForProviderError(error.toString()));
    }
  }

  void addPictureToLibrary() async {
    emit(AddPictureLoading());
    try {
      final response =
          await AuthRepository.addPictureToLibrary(image: profileImage);
      mainResponse = MainResponse.fromJson(response.data);
      if (mainResponse.errorCode == 0) {
        profileImage = null;
        getAllPicturesForProvider();
      }
      emit(AddPictureSuccess());
    } catch (error) {
      emit(AddPictureError(error.toString()));
    }
  }

  void deletePictureToLibrary({required int id}) async {
    emit(DeletePictureLoading());
    try {
      final response = await AuthRepository.deleteImage(id: id);
      mainResponse = MainResponse.fromJson(response.data);
      if (mainResponse.errorCode == 0) {
        picturesList.removeWhere((element) => element.id! == id);
      }
      emit(DeletePictureSuccess());
    } catch (error) {
      emit(DeletePictureError(error.toString()));
    }
  }

  void freelancerUpdateProfile({
    required String userName,
    required String email,
    required String description,
    required String phone,
  }) async {
    emit(UpdateProfileLoading());
    try {
      await AuthRepository.freelancerUpdateProfile(
        userName: userName,
        email: email,
        description: description,
        phone: phone,
        image: profileImage,
      );
      profileImage = null;
      emit(UpdateProfileSuccess());
    } catch (error) {
      emit(UpdateProfileError(error.toString()));
    }
  }

  void vendorUpdateProfile({
    required String userName,
    required String email,
    required String description,
    required String phone,
    required String taxNumber,
  }) async {
    emit(UpdateProfileLoading());
    try {
      await AuthRepository.vendorUpdateProfile(
          userName: userName,
          email: email,
          description: description,
          phone: phone,
          taxNumber: taxNumber,
          image: profileImage);
      profileImage = null;
      emit(UpdateProfileSuccess());
    } catch (error) {
      emit(UpdateProfileError(error.toString()));
    }
  }

  void sendComplaint({
    required String title,
    required String data,
  }) async {
    emit(SendCompLoading());
    try {
      await AuthRepository.sendComplains(title: title, data: data);
      profileImage = null;
      emit(SendCompSuccess());
    } catch (error) {
      emit(SendCompError(error.toString()));
    }
  }


  void userUpdateProfile({
     int? cityId,
    required String email,
    required String name,
    required String phoneNumber,
  }) async {
    emit(UpdateProfileLoading());
    try {
      await AuthRepository.userUpdateProfile(
          cityId: 1,
          email: email,
          name: name,
          phoneNumber: phoneNumber,
          image: profileImage);
      profileImage = null;
      emit(UpdateProfileSuccess());
    } catch (error) {
      emit(UpdateProfileError(error.toString()));
    }
  }

  void forgetPassword({
    required String phoneNumber,
  }) async {
    emit(ForgetPasswordLoading());
    try {
      final response = await AuthRepository.forgetPassword(
        phone: phoneNumber,
      );
      mainResponse = MainResponse.fromJson(response.data);
      emit(ForgetPasswordSuccess(mainResponse: mainResponse));
    } catch (error) {
      emit(ForgetPasswordError(error.toString()));
    }
  }
}
