import 'package:flutter_clean_arch_bloc/features/usera/domain/model/user_model.dart';

abstract class UsersRepository {
  Future<List<UserModel>> getUsers();
}
