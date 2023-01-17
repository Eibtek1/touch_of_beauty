import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/reservation_state.dart';
class ReservationCubit extends Cubit<ReservationState> {
  ReservationCubit() : super(ReservationInitial());
  static ReservationCubit get(context) => BlocProvider.of(context);
  int tabBarCIndex = 0;
  void changeTabBarCurrentIndex(int index){
    tabBarCIndex = index;
    emit(ChangedTabBarCurrentIndex());
  }
}
