import 'package:neobis_flutter_chapter_7/src/auth/domain/repositories/login_repository.dart';

class AuthUseCase {
  final AuthRepository repository;

  AuthUseCase({required this.repository});

  Future<void> call(String email, String password) async {
    return await repository.logIn(email, password);
  }
}
