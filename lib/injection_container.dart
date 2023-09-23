import 'package:chat_app/features/auth/data/datasources/firebase_connection.dart';
import 'package:chat_app/features/auth/data/repositories/user_repo_impl.dart';
import 'package:chat_app/features/auth/domain/repositories/user_repo.dart';
import 'package:chat_app/features/auth/domain/usecases/forget_password_use_case.dart';
import 'package:chat_app/features/auth/domain/usecases/google_sign_in_use_case.dart';
import 'package:chat_app/features/auth/domain/usecases/sign_in_use_case.dart';
import 'package:chat_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chat_app/features/onBoarding/presentation/bloc/onboarding_bloc.dart';
import 'package:get_it/get_it.dart';

import 'features/auth/domain/usecases/sign_up_use_case.dart';

final GetIt sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.allowReassignment = true;

  /// Auth
  /// FireStoreConnection
  sl.registerSingleton<FirestoreConnection>(FirestoreConnection());

  /// Repo
  sl.registerSingleton<UserRepo>(UserRepoImpl(sl()));

  /// Usecases
  sl.registerSingleton<SignInUseCase>(SignInUseCase(sl()));
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase(sl()));
  sl.registerSingleton<GoogleSignInUseCase>(GoogleSignInUseCase(sl()));
  sl.registerSingleton<ForgetPasswordUseCase>(ForgetPasswordUseCase(sl()));

  /// bloc
  sl.registerSingleton(AuthBloc(sl(), sl(), sl(), sl()));

  //// End of Auth

  /// OnBoarding
  /// Bloc
  sl.registerSingleton<OnboardingBloc>(OnboardingBloc());
}
