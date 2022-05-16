class ValidationHelper {
  static bool isEmailValid(String email) {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  static bool isEmpty(String check) {
    if (check.isEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
