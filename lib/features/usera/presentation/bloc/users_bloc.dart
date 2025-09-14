import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch_bloc/features/usera/domain/repository/users_repository.dart';
import 'package:flutter_clean_arch_bloc/features/usera/presentation/bloc/users_event.dart';
import 'package:flutter_clean_arch_bloc/features/usera/presentation/bloc/users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UsersRepository usersRepository;

  UsersBloc({required this.usersRepository}) : super(UsersState.initial()) {
    on<GetUsersEvent>(onGetUsersEvent);
  }

  Future onGetUsersEvent(GetUsersEvent event, Emitter emit) async {
    emit(state.copyWith(status: UsersStatus.loading));
    try {
      final result = await usersRepository.getUsers();
      emit(state.copyWith(status: UsersStatus.success, users: result));
    } catch (e) {
      emit(
        state.copyWith(status: UsersStatus.error, errorMessage: e.toString()),
      );
    }
  }
}
