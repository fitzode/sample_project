class StringHelper {
  StringHelper._();
 static String validatePassword(String value) {
    if (!(value.length > 5) && value.isNotEmpty) {
      return "Password should contain more than 5 characters";
    }
    return '';
  }
}
