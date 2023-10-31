class Utils{
  static bool isEmail(String input) {
    // Regular expression pattern to match email addresses
    // This pattern allows for most common email address formats
    const String emailRegex =
        r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$';
    // Create a regular expression object
    final RegExp regex = RegExp(emailRegex);
    // Check if the input matches the email pattern
    return regex.hasMatch(input);
  }

  static bool isPassword(String input) {
    // Define a regular expression pattern for password validation.
    // This regex requires at least 8 characters, one uppercase letter, one lowercase letter,
    // one digit, and one special character.
    const passwordRegex =
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
    return RegExp(passwordRegex).hasMatch(input);
  }
}