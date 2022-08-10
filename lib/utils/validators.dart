//this class has two methods staic validatepassword and validemail
//the methods are static so that they can be accessed with creating an instance of this class

class Validator {
  //this method takes a String parameter and uses if else statment to check if
  //the parameter passes some conditions to be a password
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

//This method also takes in a value. Here the Regex class in dart is used to
//specify a pattern and an if-else statement is used to check if the value
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
