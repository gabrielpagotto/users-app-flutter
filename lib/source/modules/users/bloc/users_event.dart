part of 'users_bloc.dart';

@immutable
sealed class UsersEvent extends Equatable {
  const UsersEvent();
}

final class FetchUsersEvent extends UsersEvent {
  const FetchUsersEvent();

  @override
  List<Object?> get props => [];
}
