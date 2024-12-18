// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:patch_task/src/app/product/data/data_source/product_remote_data_source_page.dart'
    as _i229;
import 'package:patch_task/src/app/product/data/repository_impl/product_repository_impl.dart'
    as _i750;
import 'package:patch_task/src/app/product/domain/repository/product_repository.dart'
    as _i124;
import 'package:patch_task/src/app/product/domain/use_case/product_use_case.dart'
    as _i158;
import 'package:patch_task/src/app/product/presentation/bloc/category_bloc/category_bloc.dart'
    as _i410;
import 'package:patch_task/src/app/product/presentation/bloc/product_bloc/product_bloc.dart'
    as _i575;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i229.ProductRemoteDataSource>(
        () => _i229.ProductRemoteDataSource());
    gh.singleton<_i124.ProductListRepository>(
        () => _i750.ProductRepositoryImpl(gh<_i229.ProductRemoteDataSource>()));
    gh.factory<_i158.ProductListUseCase>(
        () => _i158.ProductListUseCase(gh<_i124.ProductListRepository>()));
    gh.factory<_i410.CategoryBloc>(
        () => _i410.CategoryBloc(gh<_i158.ProductListUseCase>()));
    gh.factory<_i575.ProductBloc>(
        () => _i575.ProductBloc(gh<_i158.ProductListUseCase>()));
    return this;
  }
}
