import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import '../../core/enums/user_type_enum.dart';
import '../../core/utiles/local_storage.utils.dart';

part 'appcubit_state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppcubitInitial());

  static AppCubit get(context) => BlocProvider.of(context);
}
