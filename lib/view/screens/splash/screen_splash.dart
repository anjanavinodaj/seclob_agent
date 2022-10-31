import 'package:flutter/material.dart';
import 'package:seclob_agent/core/images.dart';
import 'package:seclob_agent/core/token.dart';
import 'package:seclob_agent/view/screens/home/screen_home.dart';
import 'package:seclob_agent/view/screens/login/screen_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    afterSplash(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Image.asset(kImageLogo),
        ),
      ),
    );
  }

// -- After Splash Screen --
  Future<void> afterSplash(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final bool? isLogin = prefs.getBool('login');

    // await prefs.remove('login');

    AccessToken.token = prefs.getString('token');

    if (isLogin == true) {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const ScreenHome()));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const Login()));
    }
  }
}
