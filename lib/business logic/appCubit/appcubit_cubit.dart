import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herag/core/models/posts_model.dart';
import 'package:herag/core/utiles/notification_utils.dart';
import '../../core/models/home_model.dart';
import '../../features/home/actions/get_home_action.dart';
import '../../features/home/actions/get_posts_action.dart';

part 'appcubit_state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppStates());
  HomeModel? homeModel;

  getHome() {
    emit(state.copyWith(loading: true));
    HomeAction action = HomeAction();
    action.execute();
    action.onSuccess = (res) {
      homeModel = res;
      emit(state.copyWith(
        categories: res?.body?.categories ?? [],
        sliders: res?.body?.sliders ?? [],
      ));
    };
    action.onError = (res) {
      NotificationUtils.showErrorMessage(res.message!);
    };
  }

  getSubCategory(int catId) {
    emit(state.copyWith(children: state.categories![catId].children));
  }

  getPosts({required int? categoryId}) {
    GetPostsAction action = GetPostsAction(categoryId!);
    action.execute();
    action.onSuccess = (res) {
      emit(state.copyWith(posts: res?.body?.posts));
    };
    action.onError = (res) {
      NotificationUtils.showErrorMessage(res.message!);
    };
  }

  getFavourites() {}

  contactUs() {}

  search() {}
}
