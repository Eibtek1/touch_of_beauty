import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/main_cubit/main_state.dart';
import '../../../authentication/data/models/get_user_data_model.dart';
import '../../../authentication/data/models/main_response.dart';
import '../../../authentication/data/repository/auth_repository.dart';
import '../../presentation/screens/user_home_screen.dart';
import '../../presentation/screens/user_notification_screen.dart';
import '../../presentation/screens/user_profile_screen.dart';
import '../../presentation/screens/user_reservations_screen.dart';

class MainCubit extends Cubit<MainState> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  MainCubit() : super(MainInitial());
  static MainCubit get(context) => BlocProvider.of(context);
  int cIndex = 0;
  GetUserModel? getUserModel;
  late MainResponse mainResponse;
  String? message;
  bool loadingUserDataBoolean = false;

  List<Widget> screens = [
    const UserHomeScreen(),
    const UserReservationsScreen(),
    const UserNotificationScreen(),
    const UserProfileScreen(),
  ];

  void onTap(int? index){
    cIndex = index!;
    emit(ChangeCurrentIndex());
  }
  void initFunction(){
    if(getUserModel == null){
      getUserDataFunction();
    }
  }
  void getUserDataFunction() async{
    emit(GetUserDataLoading());
    try{
      final response = await AuthRepository.getUserData();
      mainResponse = MainResponse.fromJson(response.data);
      message = mainResponse.errorMessage.toString();
      getUserModel = GetUserModel.fromJson(mainResponse.data);
      emit(GetUserDataSuccess());
    }catch(error){
      emit(GetUserDataError(error: error.toString()));
    }
  }
}
