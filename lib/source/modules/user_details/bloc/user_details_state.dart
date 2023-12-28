part of 'user_details_bloc.dart';

sealed class UserDetailsState extends Equatable {
  const UserDetailsState();
}

final class UserDetailsLoadingState extends UserDetailsState {
  const UserDetailsLoadingState();

  @override
  List<Object?> get props => [];
}

final class UserDetailsErrorState extends UserDetailsState {
  final String message;
  const UserDetailsErrorState(this.message);

  @override
  List<Object?> get props => [message];
}

final class UserDetailsReadyState extends UserDetailsState {
  final User user;
  const UserDetailsReadyState(this.user);

  @override
  List<Object?> get props => [user];
}
