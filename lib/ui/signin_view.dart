import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_state/utils/validators.dart';

// The signin View extends stateful widget because we would be managing state in our app
class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);
  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  //the form key is added to the form widget to keep track of the
  //state of the forms and to validate the forms
  final _formKey = GlobalKey<FormState>();

//in order to retrieve the text the user passed into the textfield, i created an
//instance of the TextEditingController class. This object is assigned to the
//textfield.
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

// state object that changes depending on each textfield value
  bool isEmailValid = false;
  bool isPasswordValid = false;

//whenever the user modifies the textfield, the text changes. To be notified of
//the changes to the textfield, i added a listener function to the controller. The
//listener listens for changes in the textfield.

  @override
  void initState() {
    super.initState();

    emailController.addListener(() {
      if (emailController.text
          .contains(RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z]+\.[a-zA-Z]+"))) {
        setState(() {
          isEmailValid = true;
        });
      } else {
        setState(() {
          isEmailValid = false;
        });
      }
    });
    passwordController.addListener(() {
      if (passwordController.text.length >= 8 &&
          passwordController.text.length <= 15) {
        setState(() {
          isPasswordValid = true;
        });
      } else {
        setState(() {
          isPasswordValid = false;
        });
      }
    });
  }

//the dispose method frees the memory allocated to the controllers
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xff121421),
        body: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 100.0,
                left: 30.0,
                right: 30.0,
              ),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Sign In',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 80),
                    Text(
                      'WELCOME BACK',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 8.0, top: 3.0, bottom: 3.0),
                        //
                        child: TextFormField(
                          //to validate the email, the method created in the validator class is
                          //called in the validator property of the form field.The function returns a string error message
                          //if user input is wrong and null if it is correct
                          validator: (value) => Validator.validateEmail(value!),
                          controller:
                              emailController, //the emailController object which is
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              //to show the suffix icon,
                              //if the email entered is valid, isEmailValid becomes
                              // true and setstate that was called triggers the UI to rebuild
                              //thereby causing the icon to show
                              //if the email entered is not valid, it returns
                              // false and no icon is shown
                              suffixIcon: isEmailValid
                                  ? const Icon(
                                      Icons.check_circle,
                                      color: Color(0xff4A80F0),
                                    )
                                  : null,
                              hintText: 'Email address',
                              hintStyle: GoogleFonts.roboto(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 8.0, top: 3.0, bottom: 3.0),
                        //to validate the password, the validatepassword method from the validator class
                        //is also passed to this form's validator property
                        child: TextFormField(
                          validator: (value) =>
                              Validator.validatePassword(value!),
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              //to show the suffix icon,
                              //if the password entered is valid, isPasswordValid becomes
                              // true and setstate that was called triggers the UI to rebuild
                              //thereby causing the icon to show
                              //if the password entered is not valid, it returns
                              // false and no icon is shown
                              suffixIcon: isPasswordValid
                                  ? const Icon(
                                      Icons.check_circle,
                                      color: Color(0xff4A80F0),
                                    )
                                  : null,
                              hintText: 'Password',
                              hintStyle: GoogleFonts.roboto(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    GestureDetector(
                      onTap: () {
                        //when the signin button is clicked, the formkey
                        //checks if the forms inputs are valid
                        //and if it is, the snackbar is shown

                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Signed in'),
                            backgroundColor: Color(0xff4A80F0),
                          ));
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 15,
                        decoration: BoxDecoration(
                          //to change the color of the button, both the email
                          //and password have to be valid. if both conditions return true,
                          //the button color without opacity is shown and if either
                          //returns false, the button color with opacity is shown
                          color: isEmailValid && isPasswordValid
                              ? const Color(0xff4A80F0)
                              : const Color(0xff4A80F0).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            'Sign In',
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      'Forgot password?',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 10.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Reset Password',
                        style: GoogleFonts.raleway(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
