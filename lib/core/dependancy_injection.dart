import 'package:get_it/get_it.dart';
import '../business logic/appCubit/appcubit_cubit.dart';

import 'utiles/local_storage.utils.dart';
import 'utiles/notification_utils.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Bloc
  GetIt.instance.registerLazySingleton<AppCubit>(() => AppCubit());

  sl.registerSingleton<LocalStorageUtils>(LocalStorageUtils());
  sl.registerSingleton<NotificationUtils>(NotificationUtils());

}
