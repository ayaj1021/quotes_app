import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quotes_app/src/appstyles/textstyles.dart';
import 'package:quotes_app/src/model/login_model.dart';
import 'package:quotes_app/src/services/login_service.dart';
import 'package:quotes_app/src/view/home_page.dart';
import 'package:quotes_app/src/widgets/long_buttons.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, this.user});

  final UserModel? user;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final endpoint = 'https://reqres.in/api/login';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final login = LoginService();

  bool isObscure = false;

  toggleButton() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  String _username = '', _password = '';
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      //   resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Login', style: AppTextStyle.headLine1),
                20.height,
                const Text(
                  'Kindly fill in your login details',
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
                    // validator: (value)=>validateEmail,
                    onSaved: (newValue) {
                      _username = newValue!;
                    },
                    decoration: const InputDecoration(
                        hintText: 'Enter your email',
                        prefixIcon: Icon(Icons.mail_outline)),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                20.height,
                const Text('Password', style: AppTextStyle.headLine2),
                10.height,
                Container(
                  height: height * 0.05,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black)),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: isObscure = !isObscure,
                    autofocus: false,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your password' : null,
                    onSaved: (newValue) {
                      _password = newValue!;
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
                    textInputAction: TextInputAction.done,
                    // onEditingComplete: () async {
                    //   LoginUserModel? response = await login.login(
                    //       emailController.text, passwordController.text);
                    //   Navigator.of(context).pushReplacement(
                    //       MaterialPageRoute(builder: (_) => HomePage()));
                    // },
                  ),
                ),
                30.height,
                LongButton(
                  buttonColor: Colors.blue,
                  buttonTitle: 'Login',
                  onTap: () {
                    onTapLogin();
                    //   Navigator.pushReplacementNamed(context, '/homepage');
                  },
                ),
                20.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/signup');
                      },
                      child: const Text(
                        'Don\'t have an account? Signup',
                        style: AppTextStyle.bodyText,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }

  onTapLogin() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var response = await http.post(Uri.parse(endpoint),
          body: ({
            "email": emailController.text,
            "password": passwordController.text,
          }));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        //  print('Login Token' + body['token']);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Token: ${body['token']}')));
        pageRoute(body['token']);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Invalid credentials')));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please Enter your details')));
    }
  }

  void pageRoute(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('login', token);
Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false);
  }
}
