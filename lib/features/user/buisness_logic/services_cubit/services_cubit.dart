import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/services_cubit/services_state.dart';
import 'package:touch_of_beauty/features/user/data/repository/services_providers_repository.dart';

class ServicesCubit extends Cubit<ServicesState> {
  ServicesCubit() : super(ServicesInitial());
  static ServicesCubit get(context) {
    return BlocProvider.of(context);
  }

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
