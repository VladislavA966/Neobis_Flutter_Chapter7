abstract class RegistrationRepository {
  Future<void> sendRegistrationData (String email, String login, String password);
}