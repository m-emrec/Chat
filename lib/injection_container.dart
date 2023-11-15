import 'package:chat_app/features/auth/data/datasources/firebase_connection.dart';
import 'package:chat_app/features/auth/data/models/user_model.dart';
import 'package:chat_app/features/auth/data/repositories/user_repo_impl.dart';
import 'package:chat_app/features/auth/domain/entities/user_entity.dart';
import 'package:chat_app/features/auth/domain/repositories/user_repo.dart';
import 'package:chat_app/features/auth/domain/usecases/fetch_user_data.dart';
import 'package:chat_app/features/auth/domain/usecases/forget_password_use_case.dart';
import 'package:chat_app/features/auth/domain/usecases/google_sign_in_use_case.dart';
import 'package:chat_app/features/auth/domain/usecases/sign_in_use_case.dart';
import 'package:chat_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chat_app/features/onBoarding/data/datasources/firestore_connection.dart';
import 'package:chat_app/features/onBoarding/data/repositories/onboarding_repo_impl.dart';
import 'package:chat_app/features/onBoarding/domain/repositories/onboarding_repo.dart';
import 'package:chat_app/features/onBoarding/domain/usecases/register_data_to_firestore_usecase.dart';
import 'package:chat_app/features/onBoarding/presentation/bloc/onboarding_bloc.dart';
import 'package:chat_app/features/profile/data/datasources/proifle_firestore_connection.dart';
import 'package:chat_app/features/profile/data/repositories/profile_repo_impl.dart';
import 'package:chat_app/features/profile/domain/repositories/profile_repo.dart';
import 'package:chat_app/features/profile/domain/usecases/update_user_data_usecase.dart';
import 'package:chat_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:get_it/get_it.dart';

import 'features/auth/domain/usecases/sign_up_use_case.dart';
import 'features/profile/domain/usecases/feth_user_data_usecase.dart';

final GetIt sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.allowReassignment = true;

  //! Auth
  /// FireStoreConnection
  sl.registerSingleton<FirestoreConnection>(FirestoreConnection());

  /// Repo
  sl.registerSingleton<UserRepo>(UserRepoImpl(sl()));

  /// Usecases
  sl.registerSingleton<SignInUseCase>(SignInUseCase(sl()));
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase(sl()));
  sl.registerSingleton<GoogleSignInUseCase>(GoogleSignInUseCase(sl()));
  sl.registerSingleton<ForgetPasswordUseCase>(ForgetPasswordUseCase(sl()));
  sl.registerSingleton<FetchUserDataUseCase>(FetchUserDataUseCase(sl()));

  /// bloc
  sl.registerSingleton(AuthBloc(sl(), sl(), sl(), sl(), sl()));

  //// End of Auth

  //! OnBoarding

  /// Firebase Connection
  sl.registerSingleton<FireBaseFirestoreConnection>(
      FireBaseFirestoreConnection());

  /// Repo
  sl.registerSingleton<OnboardingRepo>(OnboardingRepoImpl(sl()));

  /// Usecase
  sl.registerSingleton<RegisterDataToFireStoreUsecase>(
      RegisterDataToFireStoreUsecase(sl()));

  /// Bloc
  sl.registerSingleton<OnboardingBloc>(OnboardingBloc(sl()));
}

Future<void> initializeDependenciesAfterAuth() async {
//! Profile

  /// firestore
  sl.registerSingleton<ProfileFireStoreConnection>(
      ProfileFireStoreConnection());

  /// Repo
  sl.registerSingleton<ProfileRepo>(
    ProfileRepoImpl(sl()),
  );

  /// Usecases
  sl.registerSingleton<FetchUserDataUsecase>(
    FetchUserDataUsecase(sl()),
  );

  sl.registerSingleton<UpdateUserDataUsecase>(
    UpdateUserDataUsecase(sl()),
  );

  /// Bloc
  sl.registerSingleton<ProfileBloc>(
    ProfileBloc(sl(), sl()),
  );
}
