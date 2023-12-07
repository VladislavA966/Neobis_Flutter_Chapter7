mixin PasswordValidation {
  bool isValidLength(String password) {
    return password.length >= 8 && password.length <= 15;
  }

  bool hasAlphabetic(String password) {
    return password.contains(RegExp(r'[a-zA-Z]'));
  }

  bool hasDigit(String password) {
    return password.contains(RegExp(r'[0-9]'));
  }

  bool hasSpecialChar(String password) {
    return password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }

  bool isValidPassword(String password) {
    return isValidLength(password) &&
        hasAlphabetic(password) &&
        hasDigit(password) &&
        hasSpecialChar(password);
  }
}
