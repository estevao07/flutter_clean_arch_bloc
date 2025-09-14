import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch_bloc/core/dependecy_injection.dart';
import 'package:flutter_clean_arch_bloc/features/usera/presentation/bloc/users_bloc.dart';
import 'package:flutter_clean_arch_bloc/features/usera/presentation/bloc/users_event.dart';
import 'package:flutter_clean_arch_bloc/features/usera/presentation/bloc/users_state.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UsersBloc>()..add(GetUsersEvent()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Users')),
        body: BlocBuilder<UsersBloc, UsersState>(
          builder: (context, state) {
            if (state.status == UsersStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.status == UsersStatus.success) {
              return ListView.builder(
                itemCount: state.users?.length ?? 0,
                itemBuilder: (context, index) {
                  final user = state.users![index];
                  return ListTile(
                    title: Text(user.firstName),
                    subtitle: Text(user.email),
                  );
                },
              );
            } else if (state.status == UsersStatus.error) {
              return Center(child: Text('Error: ${state.errorMessage}'));
            } else {
              return const Center(child: Text('No data'));
            }
          },
        ),
      ),
    );
  }
}
