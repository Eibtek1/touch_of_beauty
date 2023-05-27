import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touch_of_beauty/features/authentication/data/models/main_response.dart';
import 'package:touch_of_beauty/features/vendor/data/repository/services_repo.dart';
import '../../../user/data/models/available_time_data_model.dart';
import '../../data/models/work_hours_model.dart';
import '../work_hours_cubit/work_hours_state.dart';
class WorkHoursCubit extends Cubit<WorkHoursState> {
  WorkHoursCubit() : super(WorkHoursInitial());
  static WorkHoursCubit get(context) => BlocProvider.of(context);
  List<WorkHoursModel> workOursList = [];
  List<AvailableDateModel> availableWorkOursList = [];
  late MainResponse mainResponse;
  DateTime? from;
  DateTime? to;
  DateTime? moreData;
  bool isUpdateOrAdd = false;
  void changeDate(){
    emit(ChangeDate());
  }
  void getWorkHours()async{
    emit(WorkHoursLoading());
    try{
      final response = await VendorServicesRepository.getWorkHours();
      mainResponse  = MainResponse.fromJson(response.data);
      if(mainResponse.errorCode == 0){
        workOursList = [];
        for(var element in mainResponse.data){
          workOursList.add(WorkHoursModel.fromJson(element));
        }
        emit(WorkHoursSuccess());
      }else{
        workOursList = [];
        emit(WorkHoursSuccess());
      }
    }catch(error){
      emit(WorkHoursError(error.toString()));
    }
  }
  void addWorkHours({required int day,}) async{
    isUpdateOrAdd = true;
    emit(AddWorkHoursLoading());
    try{
      final response = await VendorServicesRepository.addWorkHours(day: day, from: from!, to: to!, moreData: moreData!);
      mainResponse  = MainResponse.fromJson(response.data);
      if(mainResponse.errorCode == 0){
        isUpdateOrAdd = false;
        emit(AddWorkHoursSuccess());
      }else{
        print(mainResponse);
        isUpdateOrAdd = false;
        emit(UpdateWorkHoursSuccess());
      }
    }catch(error){
      isUpdateOrAdd = false;
      emit(AddWorkHoursError(error.toString()));
    }
  }
  void updateWorkHours({required int day,required int id,}) async{
    isUpdateOrAdd = true;
    emit(UpdateWorkHoursLoading());
    try{
      final response = await VendorServicesRepository.updateWorkHours(day: day, from: from!, to: to!, id: id, moreData: moreData!);
      mainResponse  = MainResponse.fromJson(response.data);
      if(mainResponse.errorCode == 0){
        isUpdateOrAdd = false;
        emit(UpdateWorkHoursSuccess());
      }else{
        print(mainResponse);
        isUpdateOrAdd = false;
        emit(UpdateWorkHoursSuccess());
      }
    }catch(error){
      isUpdateOrAdd = false;
      emit(UpdateWorkHoursError(error.toString()));
    }
  }



  void deleteWorkHours({required int id}) async {
    emit(DeleteWorkHoursLoading());
    try {
      final response = await VendorServicesRepository.deleteWorkHours(id: id);
      mainResponse = MainResponse.fromJson(response.data);
      if (mainResponse.errorCode == 0) {
        emit(DeleteWorkHoursSuccess());
      }
    } catch (error) {
      emit(DeleteWorkHoursError(error.toString()));
    }
  }


  void getAvailableWorkHours({required String providerId})async{
    emit(GetAvailableWorkHoursLoading());
    try{
      final response = await VendorServicesRepository.getAvailableWorkHours(providerId:providerId);
      mainResponse  = MainResponse.fromJson(response.data);
      if(mainResponse.errorCode == 0){
        availableWorkOursList = [];
        for(var element in mainResponse.data){
          availableWorkOursList.add(AvailableDateModel.fromJson(element));
        }
        emit(GetAvailableWorkHoursSuccess());
      }else{
        availableWorkOursList = [];
        emit(GetAvailableWorkHoursSuccess());
      }
      print(availableWorkOursList);
    }catch(error){
      emit(GetAvailableWorkHoursError(error.toString()));
    }
  }
}
