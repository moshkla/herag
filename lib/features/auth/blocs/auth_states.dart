import '../../../core/models/profile_model.dart';

class AuthStates {
  bool? loading;
  ProfileModel? profileModel;

  AuthStates({
    this.loading,
    this.profileModel,
  });

  AuthStates copyWith({
    bool? loading,
    ProfileModel? profileModel,
  }) {
    return AuthStates(
      loading: loading ?? this.loading,
      profileModel: profileModel ?? this.profileModel,
    );
  }

  @override
  bool operator ==(covariant AuthStates other) {
    if (identical(this, other)) return true;

    return other.loading == loading &&
        other.profileModel== profileModel;
  }

  @override
  int get hashCode {
    return loading.hashCode ^ profileModel.hashCode;
  }
}

class AuthInitial extends AuthStates {}


