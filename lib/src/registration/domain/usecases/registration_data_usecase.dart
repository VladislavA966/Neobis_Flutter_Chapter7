import 'package:neobis_flutter_chapter_7/src/registration/domain/entities/registration_user_data.dart';
import 'package:neobis_flutter_chapter_7/src/registration/domain/repositories/registration_repository.dart';

class RegistrationUseCase {
  final RegistrationRepository repository;

  RegistrationUseCase(this.repository);

  Future<void> call(
      String email,  String login, String password) async {
    return await repository.sendRegistrationData(email, login, password);
  }
}
