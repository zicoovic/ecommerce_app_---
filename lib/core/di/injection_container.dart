import 'package:ecommerce_app/core/network/api_service.dart';
import 'package:ecommerce_app/core/theme/theme_cubit.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:ecommerce_app/features/onboarding/domain/usecases/save_gender_usecase.dart';
import 'package:ecommerce_app/features/onboarding/presentation/bloc/onboarding_cubit.dart';
import 'package:ecommerce_app/features/products/data/data_sources/product_remote_data_source.dart';
import 'package:ecommerce_app/features/products/data/repositories/product_repository_impl.dart';
import 'package:ecommerce_app/features/products/domain/repositories/product_repository.dart';
import 'package:ecommerce_app/features/products/presentation/bloc/products_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // External dependencies - SharedPreferences must be initialized first
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // Core
  getIt.registerLazySingleton<ApiService>(() => ApiService());

  // Theme
  getIt.registerLazySingleton<ThemeCubit>(
    () => ThemeCubit(pref: getIt<SharedPreferences>()),
  );

  // Onboarding features
  getIt.registerLazySingleton<SaveGenderUseCase>(
    () => SaveGenderUseCase(),
  );

  getIt.registerFactory<OnboardingCubit>(
    () => OnboardingCubit(getIt<SaveGenderUseCase>()),
  );

  // Auth features
  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(sharedPreferences: getIt<SharedPreferences>()),
  );

  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(apiService: getIt<ApiService>()),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemoteDataSource: getIt<AuthRemoteDataSource>(),
      authLocalDataSource: getIt<AuthLocalDataSource>(),
    ),
  );

  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt()));

  // Products features
  getIt.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSource(apiService: getIt<ApiService>()),
  );

  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      productRemoteDataSource: getIt<ProductRemoteDataSource>(),
    ),
  );

  getIt.registerFactory<ProductsCubit>(
    () => ProductsCubit(getIt<ProductRepository>()),
  );
}