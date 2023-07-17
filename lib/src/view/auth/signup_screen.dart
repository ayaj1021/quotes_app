import 'package:flutter/material.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quotes_app/src/appstyles/textstyles.dart';
import 'package:quotes_app/src/utils/validator.dart';
import 'package:quotes_app/src/widgets/long_buttons.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController confirmPwdController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  onTapRegister() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();

      if (_password.endsWith(_confirmPassword)) {
      } else {
        Flushbar(
          title: 'Password doesn\'t match',
          message: 'Please enter correct password',
          duration: const Duration(seconds: 5),
        ).show(context);
      }
    } else {
      Flushbar(
        title: 'Invalid form',
        message: 'Please complete the form properly',
        duration: const Duration(seconds: 5),
      ).show(context);
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('Enter login details')),
      // );
    }
  }

  bool isObscure = false;

  toggleButton() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  final String errorMessage = 'Please enter your password';

  String _username = '', _password = '', _confirmPassword = '';
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Sign Up', style: AppTextStyle.headLine1),
                20.height,
                const Text(
                  'Kindly fill in your full details',
                  style: AppTextStyle.bodyText,
                ),
                40.height,
                const Text('Email', style: AppTextStyle.headLine2),
                10.height,
                Container(
                  height: height * 0.05,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black)),
                  child: TextFormField(
                    controller: emailController,
                    autofocus: false,
                    validator: (value) {
                      validateEmail(value!);
                    },
                    onSaved: (newValue) {
                      _username = newValue!;
                    },
                    decoration: const InputDecoration(
                        hintText: 'Enter your email',
                        contentPadding: EdgeInsets.only(top: 4),
                        prefixIcon: Icon(Icons.mail_outline)),
                  ),
                ),
                20.height,
                const Text('Password', style: AppTextStyle.headLine2),
                10.height,
                Container(
                  //   padding: const EdgeInsets.symmetric(vertical: 10),
                  height: height * 0.05,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black)),
                  child: TextFormField(
                    controller: pwdController,
                    obscureText: isObscure,
                    autofocus: false,
                    validator: (value) => value!.isEmpty ? errorMessage : null,
                    onSaved: (newValue) {
                      _password = newValue!;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your password',
                      // contentPadding: const EdgeInsets.only(top: 20),
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                          onPressed: toggleButton,
                          icon: Icon(
                            isObscure == true
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                          )),
                    ),
                  ),
                ),
                5.height,
                Text(errorMessage),
                20.height,
                const Text('Confirm password', style: AppTextStyle.headLine2),
                10.height,
                Container(
                  height: height * 0.05,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black)),
                  child: TextFormField(
                    controller: confirmPwdController,
                    obscureText: isObscure,
                    autofocus: false,
                    validator: (value) =>
                        value!.isEmpty ? 'Please confirm password' : null,
                    onSaved: (newValue) {
                      _confirmPassword = newValue!;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your password',
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                          onPressed: toggleButton,
                          icon: Icon(
                            isObscure == true
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                          )),
                    ),
                  ),
                ),
                30.height,
                LongButton(
                  buttonColor: Colors.blue,
                  buttonTitle: 'Sign Up',
                  onTap: onTapRegister,
                ),
                20.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: const Text(
                        'Already have an account? Login',
                        style: AppTextStyle.bodyText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
