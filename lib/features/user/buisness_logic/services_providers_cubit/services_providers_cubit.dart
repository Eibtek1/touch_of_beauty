import 'package:flutter_bloc/flutter_bloc.dart';
import 'services_providers_state.dart';

class ServicesProvidersCubit extends Cubit<ServicesProvidersState> {
  ServicesProvidersCubit() : super(ServicesProvidersInitial());
}
