import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_app/source/exception/repository_exception.dart';
import 'package:users_app/source/get_it.dart';
import 'package:users_app/source/models/user.dart';
import 'package:users_app/source/repositories/user_repository.dart';

part 'user_details_event.dart';
part 'user_details_state.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  UserDetailsBloc() : super(const UserDetailsLoadingState()) {
    on<FetchUserDetailsEvent>(_fetchUserDetails);
  }

  FutureOr<void> _fetchUserDetails(FetchUserDetailsEvent event, Emitter<UserDetailsState> emit) async {
    emit(const UserDetailsLoadingState());
    try {
      final user = await getIt<UserRepository>().findById(event.userId);
      emit(UserDetailsReadyState(user));
    } on RepositoryException catch (err) {
      emit(UserDetailsErrorState(err.message));
    }
    return null;
  }
}
