import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_app/source/modules/user_details/user_details_view.dart';
import 'package:users_app/source/modules/users/bloc/users_bloc.dart';
import 'package:users_app/source/widgets/api_call_failed_widget.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  static const route = '/users';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersBloc()..add(const FetchUsersEvent()),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Usuários'),
          ),
          body: SafeArea(
            bottom: false,
            child: BlocBuilder<UsersBloc, UsersState>(
              builder: (context, state) {
                if (state is UsersListReadyState) {
                  return ListView.separated(
                    itemCount: state.users.length,
                    separatorBuilder: (context, index) => const Divider(height: 0, indent: 17),
                    itemBuilder: (context, index) {
                      final user = state.users[index];
                      return ListTile(
                        onTap: () => Navigator.of(context).pushNamed(UserDetailsView.route, arguments: user.id),
                        title: Text(user.name),
                        subtitle: Text(user.username, style: TextStyle(color: Theme.of(context).hintColor)),
                        trailing: Icon(Icons.chevron_right, color: Theme.of(context).hintColor),
                      );
                    },
                  );
                } else if (state is UsersErrorState) {
                  return Align(
                    child: ApiCallFailedWidget(
                      message: state.message,
                      onTryAgain: () => context.read<UsersBloc>().add(const FetchUsersEvent()),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
              },
            ),
          ),
        );
      }),
    );
  }
}
