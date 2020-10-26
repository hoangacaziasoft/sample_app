import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:injectable/injectable.dart';

abstract class NetworkInfo {
  Future<bool> hasConnect();
}

@Injectable(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker checker;

  NetworkInfoImpl(this.checker);

  @override
  Future<bool> hasConnect() async {
    return await checker.hasConnection;
  }
}
