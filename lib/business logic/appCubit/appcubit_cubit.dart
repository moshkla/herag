import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herag/features/ad_details/actions/get_home_action.dart';

part 'appcubit_state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);
  getHome(){
    HomeAction action= HomeAction();
    action.onSuccess=(res){};
    action.onError=(res){};
  }
  getPosts(){
    HomeAction action= HomeAction();
    action.onSuccess=(res){};
    action.onError=(res){};
  }
  getFavourites(){

  }
  contactUs(){

  }
  search(){}

}
