import 'package:flutter_bloc/flutter_bloc.dart';

part 'appcubit_state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppcubitInitial());

  static AppCubit get(context) => BlocProvider.of(context);
}
