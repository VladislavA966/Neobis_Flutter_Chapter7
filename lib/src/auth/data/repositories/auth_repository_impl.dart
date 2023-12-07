import 'package:neobis_flutter_chapter_7/src/auth/data/datasources/auth_remote_data_source.dart';
import 'package:neobis_flutter_chapter_7/src/auth/domain/repositories/login_repository.dart';
import 'package:neobis_flutter_chapter_7/src/registration/data/remote_data_sources/registration_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<void> logIn(String email, String password) async {
    final remoteRegister =
        await authRemoteDataSource.sendAuthData(email, password);
  }
}
