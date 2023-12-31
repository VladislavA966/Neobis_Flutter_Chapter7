import 'package:neobis_flutter_chapter_7/src/registration/domain/repositories/registration_repository.dart';
import 'package:neobis_flutter_chapter_7/core/validation/validation.dart';

class RegistrationUseCase with PasswordValidation {
  final RegistrationRepository repository;

  RegistrationUseCase({required this.repository});

  Future<void> call(String email, String login, String password) async {
    return await repository.sendRegistrationData(email, login, password);
  }
}
