import 'package:neobis_flutter_chapter_7/src/auth/domain/entities/user.dart';
import 'package:neobis_flutter_chapter_7/src/auth/domain/repositories/login_repository.dart';

class AuthUseCase {
  final AuthRepository repository;

  AuthUseCase(this.repository);

  Future<AuthEntity> call(String email, String password) async {
    return await repository.logIn(email, password);
  }
}
