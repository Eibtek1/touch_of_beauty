import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'check_publish_state.dart';

class CheckPublishCubit extends Cubit<CheckPublishState> {
  CheckPublishCubit() : super(CheckPublishInitial());
}
