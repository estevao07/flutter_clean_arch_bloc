import 'package:flutter_clean_arch_bloc/core/api/api_client.dart';
import 'package:flutter_clean_arch_bloc/features/usera/data/datasource/users_remote_datasource.dart';
import 'package:flutter_clean_arch_bloc/features/usera/data/repository/users_repository_imp.dart';
import 'package:flutter_clean_arch_bloc/features/usera/domain/repository/users_repository.dart';
import 'package:flutter_clean_arch_bloc/features/usera/presentation/bloc/users_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton(ApiClient());

  getIt.registerSingleton(getIt<ApiClient>().gettDio());

  getIt.registerLazySingleton(() => UsersRemoteDatasource(dio: getIt()));

  getIt.registerLazySingleton<UsersRepository>(
    () => UsersRepositoryImp(usersRemoteDatasource: getIt()),
  );

  getIt.registerFactory(() => UsersBloc(usersRepository: getIt()));
}
