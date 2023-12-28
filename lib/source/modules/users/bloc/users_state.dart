part of 'users_bloc.dart';

@immutable
sealed class UsersState extends Equatable {
  const UsersState();
}

final class UsersLoadingState extends UsersState {
  const UsersLoadingState();

  @override
  List<Object?> get props => [];
}

final class UsersErrorState extends UsersState {
  final String message;
  const UsersErrorState(this.message);

  @override
  List<Object?> get props => [message];
}

final class UsersListReadyState extends UsersState {
  final List<User> users;
  const UsersListReadyState(this.users);

  @override
  List<Object?> get props => [users];
}
