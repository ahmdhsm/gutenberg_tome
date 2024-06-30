// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:gutenberg_tome/app/data/datasources/book_local_data_source.dart'
    as _i6;
import 'package:gutenberg_tome/app/data/datasources/book_remote_data_source.dart'
    as _i8;
import 'package:gutenberg_tome/app/data/datasources/favorite_book_local_data_source.dart'
    as _i7;
import 'package:gutenberg_tome/app/domain/repositories/book_repository.dart'
    as _i10;
import 'package:gutenberg_tome/app/domain/repositories/favorite_book_repository.dart'
    as _i9;
import 'package:gutenberg_tome/app/presentation/cubits/book_list/book_list_cubit.dart'
    as _i12;
import 'package:gutenberg_tome/app/presentation/cubits/favorite_book/favorite_book_cubit.dart'
    as _i11;
import 'package:gutenberg_tome/core/helper/dio_helper.dart' as _i5;
import 'package:gutenberg_tome/core/injector/module.dart' as _i13;
import 'package:injectable/injectable.dart' as _i2;
import 'package:realm/realm.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.Dio>(() => registerModule.dio);
    gh.factory<_i4.Realm>(() => registerModule.realm);
    gh.factory<_i5.DioHelper>(() => _i5.DioHelper(gh<_i3.Dio>()));
    gh.factory<_i6.BookLocalDataSource>(
        () => _i6.BookLocalDataSource(gh<_i4.Realm>()));
    gh.factory<_i7.FavoriteBookLocalDataSource>(
        () => _i7.FavoriteBookLocalDataSource(gh<_i4.Realm>()));
    gh.factory<_i8.BookRemoteDataSource>(
        () => _i8.BookRemoteDataSource(gh<_i5.DioHelper>()));
    gh.factory<_i9.FavoriteBookRepository>(() => _i9.FavoriteBookRepository(
        localDataSource: gh<_i7.FavoriteBookLocalDataSource>()));
    gh.factory<_i10.BookRepository>(() => _i10.BookRepository(
          remoteDataSource: gh<_i8.BookRemoteDataSource>(),
          localDataSource: gh<_i6.BookLocalDataSource>(),
        ));
    gh.factory<_i11.FavoriteBookCubit>(
        () => _i11.FavoriteBookCubit(gh<_i9.FavoriteBookRepository>()));
    gh.factory<_i12.BookListCubit>(
        () => _i12.BookListCubit(gh<_i10.BookRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i13.RegisterModule {}
