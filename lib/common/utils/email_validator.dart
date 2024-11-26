class EmailValidator {
  static bool validate(String? value) {
    final emailRegex =
        RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');

    if ((value == null || value.isEmpty) || !emailRegex.hasMatch(value)) {
      return false;
    }
    return true;
  }
}
