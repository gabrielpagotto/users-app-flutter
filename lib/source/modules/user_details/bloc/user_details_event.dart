part of 'user_details_bloc.dart';

sealed class UserDetailsEvent extends Equatable {
  const UserDetailsEvent();
}

final class FetchUserDetailsEvent extends UserDetailsEvent {
  final int userId;
  const FetchUserDetailsEvent(this.userId);

  @override
  List<Object?> get props => [];
}
