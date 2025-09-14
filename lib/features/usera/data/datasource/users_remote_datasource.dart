import 'package:dio/dio.dart';
import 'package:flutter_clean_arch_bloc/features/usera/domain/model/user_model.dart';

class UsersRemoteDatasource {
  final Dio dio;

  UsersRemoteDatasource({required this.dio});

  Future<List<UserModel>> getUsers() async {
    final response = await dio.get('users');

    return (response.data['users'] as List)
        .map((user) => UserModel.fromJson(user))
        .toList();
  }
}
