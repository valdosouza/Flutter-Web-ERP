import 'package:erpgestao/app/core/error/exceptions.dart';
import 'package:erpgestao/app/modules/auth/data/model/auth_model.dart';

abstract class AuthLocalDatasource {
  /// Gets the cached [AuthModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<AuthModel> getLastAuthentication();
  Future<void> cacheAuthentication(AuthModel authToCache);
}
