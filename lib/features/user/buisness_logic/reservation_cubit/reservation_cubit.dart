import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touch_of_beauty/features/authentication/data/models/main_response.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/reservation_cubit/reservation_state.dart';

import '../../data/models/reservation_model.dart';
import '../../data/repository/services_providers_repository.dart';
class ReservationCubit extends Cubit<ReservationState> {
  ReservationCubit() : super(ReservationInitial());
  static ReservationCubit get(context) => BlocProvider.of(context);
  int tabBarCIndex = 0;
  List<ReservationModel> reservationsList =[];
  late MainResponse mainResponse;
  void changeTabBarCurrentIndex(int index){
    tabBarCIndex = index;
    emit(ChangedTabBarCurrentIndex());
  }

  void getOrdersForUser() async{
    emit(GetReservationsLoadingState());
    try{
      final response = await ServicesProvidersRepository.getOrdersForUser();
      mainResponse = MainResponse.fromJson(response.data);
      for(var element in mainResponse.data){
        if(!reservationsList.contains(ReservationModel.fromJson(element))){
          reservationsList.add(ReservationModel.fromJson(element));
        }
        if(reservationsList.any((e) => e.id == element['id']&&e.orderStatus!<element['orderStatus'])){
          reservationsList.removeWhere((e) => e.id == element['id']&&e.orderStatus!<element['orderStatus']);
        }
      }
      emit(GetReservationsSuccessState());
    }catch(error){
    emit(GetReservationsErrorState(error.toString()));
    }
  }

  void confirmOrder({required int id}) async{
    emit(ConfirmOrderLoadingState());
    try{
      final response = await ServicesProvidersRepository.confirmOrder(id: id);
      mainResponse = MainResponse.fromJson(response.data);
      emit(ConfirmOrderSuccessState(mainResponse: mainResponse));
    }catch(error){
    emit(ConfirmOrderErrorState(error.toString()));
    }
  }

  void addServiceRating({
    required int rating,
    required int serviceId,
  }) async{
    emit(AddServiceRatingLoadingState());
    try{
      final response = await ServicesProvidersRepository.addServiceRating(rating: rating, serviceId: serviceId);
      mainResponse = MainResponse.fromJson(response.data);
      emit(AddServiceRatingSuccessState(mainResponse: mainResponse));
    }catch(error){
    emit(AddServiceRatingErrorState(error.toString()));
    }
  }

  void addServiceProviderRating({
    required int rating,
    required String serviceProviderId,
  }) async{
    emit(AddServiceProviderRatingLoadingState());
    try{
      final response = await ServicesProvidersRepository.addServiceProviderRating(rating: rating, serviceProviderId: serviceProviderId, );
      mainResponse = MainResponse.fromJson(response.data);
      emit(AddServiceProviderRatingSuccessState(mainResponse: mainResponse));
    }catch(error){
    emit(AddServiceProviderRatingErrorState(error.toString()));
    }
  }

  void removeOrder({required int id}) async{
    emit(RemoveOrderLoadingState());
    try{
      final response = await ServicesProvidersRepository.removeOrder(id: id);
      mainResponse = MainResponse.fromJson(response.data);
      emit(RemoveOrderSuccessState(mainResponse: mainResponse));
    }catch(error){
    emit(RemoveOrderErrorState(error.toString()));
    }
  }

}
