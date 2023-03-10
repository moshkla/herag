part of 'appcubit_cubit.dart';

// abstract class AppStates {}
//
// class AppInitial extends AppStates {}
//
// class GetHomeSuccessState extends AppStates {}
//
// class GetHomeErrorState extends AppStates {}

class AppStates {
  bool? loading;
  List<Sliders>? sliders;
  List<Categories>? categories;
  List<Children>? children;
  List<Posts>? posts;
  AdDetailsModel? adDetailsModel;
  List<Posts>? favourites;

  AppStates({
    this.loading,
    this.sliders,
    this.categories,
    this.children,
    this.posts,
    this.adDetailsModel,
    this.favourites,
  });

  AppStates copyWith({
    bool? loading,
    List<Sliders>? sliders,
    List<Categories>? categories,
    List<Children>? children,
    List<Posts>? posts,
    AdDetailsModel? adDetailsModel,
    List<Posts>? favourites,
  }) {
    return AppStates(
      loading: loading ?? this.loading,
      sliders: sliders ?? this.sliders,
      categories: categories ?? this.categories,
      children: children ?? this.children,
      posts: posts ?? this.posts,
      adDetailsModel: adDetailsModel ?? this.adDetailsModel,
      favourites: favourites ?? this.favourites,
    );
  }

  @override
  bool operator ==(covariant AppStates other) {
    if (identical(this, other)) return true;

    return other.loading == loading &&
     other.adDetailsModel == adDetailsModel &&
        listEquals(other.sliders, sliders) &&
        listEquals(other.categories, categories) &&
        listEquals(other.posts, posts) &&
        listEquals(other.favourites, favourites) &&
        listEquals(other.children, children);
  }

  @override
  int get hashCode {
    return loading.hashCode ^
        sliders.hashCode ^
        categories.hashCode ^
        posts.hashCode ^
    adDetailsModel.hashCode ^
        favourites.hashCode ^
        children.hashCode;
  }
}
