import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:seclob_agent/core/token.dart';
import 'package:seclob_agent/services/api_service.dart';
import 'package:seclob_agent/view/components/editable_box.dart';
import 'package:seclob_agent/view/providers/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home/screen_home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome back to ',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: textcolor,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Seclob ',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: textcolor,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Log in',
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 15,
                    color: secondaryTextcolor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 15),
                EditableBox(
                  controller: mobileController,
                  name: 'Mobile',
                  hint: 'Enter your mobile number ',
                  type: TextInputType.phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 5),
                EditableBox(
                  controller: passwordController,
                  name: 'Password',
                  hint: 'Enter your password ',
                  type: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                const SizedBox(height: 25),
                InkWell(
                  onTap: () async {
                    final state = _formKey.currentState!;

                    if (state.validate()) {
                      final _username = mobileController.text;
                      final _password = passwordController.text;

                      final token = await ApiService.login(
                        mobile: _username,
                        password: _password,
                      );

                      log('Status = $token');

                      if (token != null) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Logged In Successfully'),
                          backgroundColor: Colors.green,
                        ));

                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();

                        prefs.setBool('login', true);

                        prefs.setString('token', token);

                        AccessToken.token = token;

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ScreenHome()),
                        );
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Invalid username or password!'),
                          backgroundColor: Color(0xFFE57373),
                        ));
                      }
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 43,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: primaryColor),
                    child: const Center(
                      child: Text(
                        'Sign in',
                        style: TextStyle(color: primaryTextcolor, fontSize: 12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
