import 'package:get_it/get_it.dart';
import 'package:swipe/data/repositories/verification_repository_impl.dart';
import 'package:swipe/domain/repositories/verification_repository.dart';
import 'package:swipe/presentation/blocs/authorization/authorization_bloc.dart';
import 'package:swipe/presentation/screens/authorization/pages/login/cubit/log_in_cubit.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> init() async {
  _initRepositories();
  _initBlocs();
}

void _initRepositories() {
  serviceLocator.registerLazySingleton<VerificationRepository>(
      () => VerificationRepositoryImpl());
}

void _initBlocs() {
  serviceLocator.registerLazySingleton(() => AuthorizationBloc());
  serviceLocator.registerFactory(() => LogInCubit(
        authorizationBloc: serviceLocator(),
        verificationRepository: serviceLocator(),
      ));
}
