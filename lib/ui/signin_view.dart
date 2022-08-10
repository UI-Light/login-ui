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
  //the form key is addedd to the form widget to keep track of the
  //state of the forms and this will be used to valudate the form
  final _formKey = GlobalKey<FormState>();

  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xff121421),
        body: Form(
          //using the formkey, the form widget is built
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
                          //to validate the email, the function created in the validator class is
                          //called in the validator property of the form field.The functon returns an error message
                          //if user input is wrong and null if it is correct
                          validator: (value) => Validator.validateEmail(value!),
                          onSaved: (text) {
                            setState(() {
                              isValid = true;
                            });
                          },
                          decoration: InputDecoration(
                              suffixIcon: isValid
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
                        //to validate the password, the validatepassword function from the validator class
                        //is also passed to this form validator property
                        child: TextFormField(
                          validator: (value) =>
                              Validator.validatePassword(value!),
                          onSaved: (text) {
                            setState(() {
                              isValid = true;
                            });
                          },
                          decoration: InputDecoration(
                              suffixIcon: isValid
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
                        //when the signin button is clicked, an if statement is used to check if the form is valid
                        //it proceeds to show the snackbar if it is true.
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
                          color: isValid
                              ? const Color(0xff4A80F0)
                              : Color(0xff4A80F0).withOpacity(0.5),
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
