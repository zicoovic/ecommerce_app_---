import 'package:ecommerce_app/core/network/api_service.dart';
import 'package:ecommerce_app/features/products/data/data_sources/product_remote_data_source.dart';
import 'package:ecommerce_app/features/products/data/repositories/product_repository_impl.dart';
import 'package:ecommerce_app/features/products/domain/repositories/product_repository.dart';
import 'package:ecommerce_app/features/products/presentation/bloc/products_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<ApiService>(() => ApiService());

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
