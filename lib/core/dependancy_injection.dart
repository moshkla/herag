import 'package:get_it/get_it.dart';
import 'package:herag/features/chat/bloc/chat_cubit.dart';
import '../business logic/appCubit/appcubit_cubit.dart';

import '../features/auth/blocs/auth.cubit.dart';
import '../theme/themes.dart';
import 'utiles/local_storage.utils.dart';
import 'utiles/notification_utils.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //Bloc
  getIt.registerLazySingleton<AppCubit>(() => AppCubit());
  getIt.registerLazySingleton<AuthCubit>(() => AuthCubit());
  getIt.registerLazySingleton<ChatCubit>(() => ChatCubit());

  getIt.registerSingleton<LocalStorageUtils>(LocalStorageUtils());
  getIt.registerSingleton<NotificationUtils>(NotificationUtils());
  getIt.registerSingleton<ThemeService>(ThemeService());
}
