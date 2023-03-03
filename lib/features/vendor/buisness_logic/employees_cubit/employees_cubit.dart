import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../authentication/data/models/main_response.dart';
import '../../data/models/employee_model.dart';
import '../../data/repository/services_repo.dart';
import 'employees_state.dart';

class EmployeesCubit extends Cubit<EmployeesState> {
  EmployeesCubit() : super(EmployeesInitial());

  static EmployeesCubit get(context) {
    return BlocProvider.of(context);
  }

  late MainResponse mainResponse;
  List<EmployeeModel> employeesList = [];
  ImagePicker picker = ImagePicker();
  File? profileImage;


  void init(){
    if(employeesList.isEmpty){
      getEmployee();
    }
  }
  void addEmployee({
    required String name,
    required String email,
    required String phoneNumber,
  })async{
    try{
      emit(AddEmployeeLoading());
      final response = await VendorServicesRepository.addEmployee(name: name, email: email, phoneNumber: phoneNumber, image: profileImage);
      mainResponse = MainResponse.fromJson(response.data);
      if(mainResponse.errorCode == 0){
        emit(AddEmployeeSuccess());
      }
    }catch(error){
      emit(AddEmployeeError(error: error.toString()));
    }
  }

  void deleteEmployee({
    required int id,
  })async{
    try{
      emit(DeleteEmployeeLoading());
      final response = await VendorServicesRepository.deleteEmployee(id: id);
      mainResponse = MainResponse.fromJson(response.data);
      if(mainResponse.errorCode == 0){
        emit(DeleteEmployeeSuccess());
      }
    }catch(error){
      emit(DeleteEmployeeError(error: error.toString()));
    }
  }

  void getEmployee()async{
    try{
      emit(GetEmployeeLoading());
      final response = await VendorServicesRepository.getEmployees();
      mainResponse = MainResponse.fromJson(response.data);
      if(mainResponse.errorCode == 0){
        for(var element in mainResponse.data){
          if(!employeesList.contains(EmployeeModel.fromJson(element))){
            employeesList.add(EmployeeModel.fromJson(element));
          }
        }
      }
      print(response);
      emit(GetEmployeeSuccess());
    }catch(error){
      emit(GetEmployeeError(error: error.toString()));
    }
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
}
