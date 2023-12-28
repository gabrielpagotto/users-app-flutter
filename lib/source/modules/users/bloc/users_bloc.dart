import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:users_app/source/exception/repository_exception.dart';
import 'package:users_app/source/get_it.dart';
import 'package:users_app/source/models/user.dart';
import 'package:users_app/source/repositories/user_repository.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(const UsersLoadingState()) {
    on<FetchUsersEvent>(_fetchUsers);
  }

  FutureOr<void> _fetchUsers(FetchUsersEvent event, Emitter<UsersState> emit) async {
    emit(const UsersLoadingState());
    try {
      final users = await getIt<UserRepository>().getAll();
      emit(UsersListReadyState(users));
    } on RepositoryException catch (err) {
      emit(UsersErrorState(err.message));
    }
  }
}
