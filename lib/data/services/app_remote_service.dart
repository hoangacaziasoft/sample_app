import 'package:acaziasampleapp/data/http_manager/http_manager.dart';
import 'package:acaziasampleapp/data/services/remote_service.dart';
import 'package:injectable/injectable.dart';

@Named('default')
@Injectable(as: RemoteService)
class AppRemoteService implements RemoteService {
  final HttpManager httpManager;

  AppRemoteService(this.httpManager);

  @override
  Future getCountryData(String countryId) async =>
      await httpManager.get(url: 'country/$countryId');

  @override
  Future getSummaryData() => httpManager.get(url: 'summary');
}
