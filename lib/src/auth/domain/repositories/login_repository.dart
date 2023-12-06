import 'package:neobis_flutter_chapter_7/src/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<AuthEntity> logIn(String email, String password);
}
