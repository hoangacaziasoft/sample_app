// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:acaziasampleapp/ui/home/bloc/home_bloc.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/http_manager/app_http_manager.dart';
import '../data/mock/mock_app_remote_service.dart';
import '../data/services/app_remote_service.dart';
import '../data/repositories/app_repository.dart';
import '../data/storage/app_storage.dart';
import '../domain/usecases/get_country_use_case.dart';
import '../domain/usecases/get_summary_use_case.dart';
import '../data/http_manager/http_manager.dart';
import '../data/data_source/local/local_datasource.dart';
import '../core/network_info.dart';
import '../data/data_source/remote/remote_datasource.dart';
import '../data/services/remote_service.dart';
import '../domain/repositories/app_repository.dart';
import 'injector_modules.dart';
import '../data/storage/storage.dart';
import '../data/mapper/remote_mappers.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

Future<void> $initGetIt(
  GetIt get, {
  String environment,
}) async {
  final serviceModule = _$ServiceModule();
  get.registerFactory<CountryResponseMapper>(() => CountryResponseMapper());
  get.registerFactory<DataConnectionChecker>(
      () => serviceModule.connectChecker);
  get.registerFactory<NetworkInfo>(
      () => NetworkInfoImpl(get<DataConnectionChecker>()));
  get.registerFactory<RemoteService>(() => AppMockRemoteService(),
      instanceName: 'mock');
  get.registerFactory<RemoteService>(() => AppRemoteService(get<HttpManager>()),
      instanceName: 'default');
  final sharedPreferences = await serviceModule.prefs;
  get.registerFactory<SharedPreferences>(() => sharedPreferences);
  get.registerFactory<SummaryResponseMapper>(() => SummaryResponseMapper());
  get.registerFactory<LocalDataSource>(
      () => AppLocalDataSource(get<Storage>()));
  get.registerFactory<RemoteDataSource>(() => AppRemoteDataSource(
      get<RemoteService>(instanceName: 'mock'),
      get<RemoteService>(instanceName: 'default')));
  get.registerFactory<GetCountryUseCase>(() => GetCountry(get<Repository>()));
  get.registerFactory<GetSummaryUseCase>(() => GetSummary(get<Repository>()));
  get.registerFactory<HomeBloc>(
      () => HomeBloc(get<GetCountryUseCase>(), get<GetSummaryUseCase>()));

  // Eager singletons must be registered in the right order
  get.registerSingleton<HttpManager>(AppHttpManager());
  get.registerSingleton<Storage>(AppStorage(get<SharedPreferences>()));
  get.registerSingleton<Repository>(AppRepository(
    get<NetworkInfo>(),
    get<RemoteDataSource>(),
    get<LocalDataSource>(),
    get<CountryResponseMapper>(),
    get<SummaryResponseMapper>(),
  ));
  return get;
}

class _$ServiceModule extends ServiceModule {}
