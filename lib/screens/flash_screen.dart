import 'dart:async';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login/screens/home_screen.dart';
import 'package:login/screens/login_page.dart';

// ignore: use_key_in_widget_constructors
class FlashScreen extends StatefulWidget {
  @override
  _FlashScreenState createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {
  startTime() async {
    var _duration = const Duration(seconds: 2);
    return Timer(
      _duration,
      navigationPage,
    );
  }

  Future navigationPage() async {
    Navigator.of(context).pushReplacement(PageRouteBuilder(
        transitionDuration: const Duration(seconds: 5),
        pageBuilder: (_, __, ___) => const LoginPage()));
  }

  final storage = const FlutterSecureStorage();
  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  void checkLogin() async {
    String? token = await storage.read(key: "token");
    // ignore: unnecessary_null_comparison
    if (token != null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
          (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.asset(
          'assets/images/splashscreen.png',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        decoration: const BoxDecoration(color: Colors.white),
      ),
    );
  }
}
