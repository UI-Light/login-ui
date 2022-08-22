//this class has two static methods validatePassword and validateEmail
//the methods are static so that they can be accessed without creating
//an instance of this class

class Validator {
  //this method takes a String argument it then checks if the
  //argument passes some conditions to be a valid password
  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password required';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    } else if (value.length > 15) {
      return 'Too long';
    } else {
      return null;
    }
  }

//This method also takes an String argument. Here the Regex class in dart is used to
//specify a pattern for an email address. It checks if the argument passed
//matches the pattern specified.
  static String? validateEmail(String value) {
    final validEmail = RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z]+\.[a-zA-Z]+");
    if (value.isEmpty) {
      return 'Email required';
    } else if (validEmail.hasMatch(value)) {
      return null;
    } else {
      return 'Enter a valid email';
    }
  }
}
