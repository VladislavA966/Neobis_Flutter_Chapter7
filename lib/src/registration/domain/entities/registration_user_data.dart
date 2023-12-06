import 'package:neobis_flutter_chapter_7/src/registration/data/models/registration_model.dart';

class RegisterEntity {
  final String email;
  final String login;
  final String password;

  RegisterEntity(
      {required this.email, required this.login, required this.password});
}
