import 'package:flutter_clean_arch_bloc/features/usera/data/datasource/users_remote_datasource.dart';
import 'package:flutter_clean_arch_bloc/features/usera/domain/model/user_model.dart';
import 'package:flutter_clean_arch_bloc/features/usera/domain/repository/users_repository.dart';

class UsersRepositoryImp implements UsersRepository {
  final UsersRemoteDatasource usersRemoteDatasource;

  UsersRepositoryImp({required this.usersRemoteDatasource});

  @override
  Future<List<UserModel>> getUsers() async {
    return await usersRemoteDatasource.getUsers();
  }
}
