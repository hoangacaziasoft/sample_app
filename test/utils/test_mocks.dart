import 'package:acaziasampleapp/data/data_source/local/local_datasource.dart';
import 'package:acaziasampleapp/data/data_source/remote/remote_datasource.dart';
import 'package:acaziasampleapp/data/http_manager/http_manager.dart';
import 'package:acaziasampleapp/data/storage/storage.dart';
import 'package:acaziasampleapp/domain/repositories/app_repository.dart';
import 'package:mockito/mockito.dart';

class MockAppRepository extends Mock implements Repository{}

class MockRemoteDataSource extends Mock implements RemoteDataSource{}

class MockLocalDataSource extends Mock implements LocalDataSource{}

class MockStorage extends Mock implements Storage{}

class MockHttpManager extends Mock implements HttpManager{}