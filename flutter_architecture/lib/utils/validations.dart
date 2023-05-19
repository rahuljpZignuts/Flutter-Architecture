class Validations {
  static String? validateSingleField(String text) {
    if (text.isEmpty) {
      return "Field Cannot be empty";
    }
    return null;
  }
}
