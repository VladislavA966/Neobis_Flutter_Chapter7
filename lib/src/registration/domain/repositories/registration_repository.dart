import 'package:neobis_flutter_chapter_7/src/registration/domain/entities/registration_user_data.dart';

abstract class RegistrationRepository {
  Future<void> sendRegistrationData (String email, String login, String password);
}