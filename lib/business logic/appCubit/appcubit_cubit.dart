import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herag/core/models/faqsModel.dart';
import 'package:herag/core/models/posts_model.dart';
import 'package:herag/core/utiles/notification_utils.dart';
import 'package:herag/features/ad_details/actions/get_ad_details_action.dart';
import 'package:herag/features/menu/actions/contact_us_action.dart';
import '../../core/models/ad_details_model.dart';
import '../../core/models/constants_model.dart';
import '../../core/models/home_model.dart';
import '../../core/router/router.dart';
import '../../features/account/actions/get_constants_action.dart';
import '../../features/account/actions/get_faqs_action.dart';
import '../../features/ad_details/pages/ad.details.page.dart';
import '../../features/favourites/actions/get_favourites_action.dart';
import '../../features/favourites/actions/toggel_favourite_action.dart';
import '../../features/home/actions/get_home_action.dart';
import '../../features/home/actions/get_posts_action.dart';
import '../../features/home/actions/search_action.dart';

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

  List<Posts>? posts;

  getPosts({required int? categoryId}) {
    emit(state.copyWith(loading: true));
    GetPostsAction action = GetPostsAction(categoryId!);
    action.execute();
    action.onSuccess = (res) {
      posts = res?.body?.posts;
      emit(state.copyWith(posts: res?.body?.posts, loading: false));
    };
    action.onError = (res) {
      NotificationUtils.showErrorMessage(res.message!);
      emit(state.copyWith(loading: false));
    };
  }

  serachPosts(String v) async {
    emit(state.copyWith(loading: true));
    if (v.isNotEmpty) {
      await SearchAction(v).execute().then((value) {
        emit(state.copyWith(
          loading: false,
          posts: value?.body?.posts,
        ));
      });
    } else {
      emit(state.copyWith(posts: posts));
    }
  }

  toggelFavourites(int postId) {
    ToggelFavouriteAction action = ToggelFavouriteAction(postId: postId);
    action.execute();
    action.onSuccess = (res) {
      NotificationUtils.showSuccessMessage(res?.message ?? '');
    };
    action.onError = (res) {
      NotificationUtils.showErrorMessage(res.message ?? '');
    };
  }

  getFavourites() {
    emit(state.copyWith(loading: true));
    GetFavouritesAction action = GetFavouritesAction();
    action.execute();
    action.onSuccess = (res) {
      emit(state.copyWith(favourites: res?.body?.posts, loading: false));
    };
    action.onError = (res) {
      NotificationUtils.showErrorMessage(res.message ?? '');
    };
  }

  ConstantsModel? constantsModel;

  getConstants() {
    GetConstantsAction action = GetConstantsAction();
    action.execute();
    action.onSuccess = (res) {
      constantsModel = res;
    };
    action.onError = (res) {
      NotificationUtils.showErrorMessage(res.message ?? '');
    };
  }

  FaqsModel? faqsModel;

  getFaqs() {
    GetFaqsAction action = GetFaqsAction();
    action.execute();
    action.onSuccess = (res) {
      faqsModel = res;
    };
    action.onError = (res) {
      NotificationUtils.showErrorMessage(res.message ?? '');
    };
  }

  getAdDetails({required adId}) {
    emit(state.copyWith(loading: true));
    GetAdDetailsAction action = GetAdDetailsAction(adId);
    action.execute();
    action.onSuccess = (res) {
      emit(state.copyWith(adDetailsModel: res, loading: false));
      MagicRouter.navigateTo(AdDetailsPage());
    };
    action.onError = (res) {
      emit(state.copyWith(loading: false));
      NotificationUtils.showErrorMessage(res.message ?? '');
    };
  }

  contactUs({required name, required email, required phone, required message}) {
    ContactUsAction action = ContactUsAction(name, email, phone, message);
    action.execute();
    action.onSuccess = (res) {
      NotificationUtils.showSuccessMessage(res?.message ?? '');
    };
    action.onError = (res) {
      NotificationUtils.showErrorMessage(res.message ?? '');
    };
  }
}
