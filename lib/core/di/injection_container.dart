import 'package:ecommerce_app/core/network/api_service.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:ecommerce_app/features/products/data/data_sources/product_remote_data_source.dart';
import 'package:ecommerce_app/features/products/data/repositories/product_repository_impl.dart';
import 'package:ecommerce_app/features/products/domain/repositories/product_repository.dart';
import 'package:ecommerce_app/features/products/presentation/bloc/products_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<ApiService>(() => ApiService());

  // auth features

  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(apiService: getIt<ApiService>()),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () =>
        AuthRepositoryImpl(authRemoteDataSource: getIt<AuthRemoteDataSource>()),
  );

  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt()));

  // products features
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
