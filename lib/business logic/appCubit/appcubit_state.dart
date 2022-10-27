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

  AppStates({
    this.loading,
    this.sliders,
    this.categories,
    this.children,
    this.posts,
  });

  AppStates copyWith({
    bool? loading,
    List<Sliders>? sliders,
    List<Categories>? categories,
    List<Children>? children,
    List<Posts>? posts,

  }) {
    return AppStates(
      loading: loading ?? this.loading,
      sliders: sliders ?? this.sliders,
      categories: categories ?? this.categories,
      children: children ?? this.children,
      posts: posts ?? this.posts,
    );
  }

  @override
  bool operator ==(covariant AppStates other) {
    if (identical(this, other)) return true;

    return other.loading == loading &&
        listEquals(other.sliders, sliders) &&
        listEquals(other.categories, categories)&&
        listEquals(other.posts, posts)&&
        listEquals(other.children, children);
  }

  @override
  int get hashCode {
    return loading.hashCode ^
    sliders.hashCode ^
    categories.hashCode ^
    posts.hashCode ^
    children.hashCode ;
  }
}
