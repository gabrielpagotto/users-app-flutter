import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_app/source/modules/user_details/bloc/user_details_bloc.dart';
import 'package:users_app/source/widgets/api_call_failed_widget.dart';
import 'package:users_app/source/widgets/inline_info_widget.dart';
import 'package:users_app/source/widgets/section_label_widget.dart';

class UserDetailsView extends StatelessWidget {
  final int userId;
  const UserDetailsView({super.key, required this.userId});

  static const route = '/user-details';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDetailsBloc()..add(FetchUserDetailsEvent(userId)),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Detalhes do usuário'),
          ),
          body: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900.0),
              child: SafeArea(
                bottom: false,
                child: BlocBuilder<UserDetailsBloc, UserDetailsState>(
                  builder: (context, state) {
                    if (state is UserDetailsReadyState) {
                      return ListView(
                        children: [
                          const SectionLabel('Informações do usuário'),
                          InlineInfoWidget(label: 'Nome', value: state.user.name),
                          InlineInfoWidget(label: 'Nome de usuário', value: state.user.username),
                          InlineInfoWidget(label: 'Email', value: state.user.email),
                          InlineInfoWidget(label: 'Número de telefone', value: state.user.phone),
                          const SectionLabel('Informações de endereço'),
                          InlineInfoWidget(label: 'Rua', value: state.user.address.street),
                          InlineInfoWidget(label: 'Cidade', value: state.user.address.city),

                          // InlineInfo(label: 'Estado', value: state.user.address...),
                          // ESTADO NÃO FOI ADICIONADO COMO REQUERIDO, POIS NÃO EXISTE ESTA INFORMAÇÃO NA API.

                          InlineInfoWidget(label: 'CEP', value: state.user.address.zipcode),
                        ],
                      );
                    } else if (state is UserDetailsErrorState) {
                      return Align(
                        child: ApiCallFailedWidget(
                          message: state.message,
                          onTryAgain: () => context.read<UserDetailsBloc>().add(FetchUserDetailsEvent(userId)),
                        ),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator.adaptive());
                    }
                  },
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
