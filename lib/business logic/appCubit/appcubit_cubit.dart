import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herag/features/ad_details/actions/get_home_action.dart';

import '../../core/models/home_model.dart';

part 'appcubit_state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);
  HomeModel? homeModel;
  getHome(){
    HomeAction action= HomeAction();
    action.execute();
    action.onSuccess=(res){
      homeModel = res;
      emit(GetHomeSuccessState());
    };
    action.onError=(res){
      emit(GetHomeErrorState());
    };
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
