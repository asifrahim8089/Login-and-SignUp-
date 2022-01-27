import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login/app_constants.dart';
import 'package:login/screens/home_screen.dart';
import 'package:login/screens/login_page.dart';
import 'package:login/snack_bar.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool vis = true;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool validate = false;
  bool circular = false;
  final storage = const FlutterSecureStorage();

  void validateAndSave() async {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      setState(() {
        circular = true;
      });
      Map<String, String> data = {
        "username": _phoneController.text,
        "password": _passwordController.text,
        "name": _nameController.text
      };
      FlutterSecureStorage storage = const FlutterSecureStorage();
      final String? token = await storage.read(key: "token");
      final Uri url = Uri.https(baseUrl, apiUrl + "/auth/register/customer");
      final response = await http.post(url, body: jsonEncode(data), headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      });
      if (response.statusCode == 201) {
        Map<String, dynamic> output = json.decode(response.body);
        await storage.write(key: "token", value: output["token"]);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
            (route) => false);
      } else {
        showSnackBar(
            duration: const Duration(milliseconds: 10000),
            context: context,
            message: "User Exist");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Form(
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 70,
                        backgroundColor: HexColor("#01A0C9"),
                        child: const Icon(
                          Icons.screen_lock_rotation_rounded,
                          size: 70,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Text(
                "Create New Account",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                elevation: 5,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  leading: Icon(
                    Icons.phone_android,
                    color: HexColor("#01A0C9"),
                  ),
                  title: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        onChanged: (text) {},
                        controller: _phoneController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: const Color(0xFFFFFFFF),
                          hintText: "Phone",
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w300,
                          ),
                          // prefixText: "+974 |  ",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                elevation: 5,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  leading: Icon(
                    Icons.person,
                    color: HexColor("#01A0C9"),
                  ),
                  title: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        onChanged: (text) {},
                        controller: _nameController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: const Color(0xFFFFFFFF),
                          hintText: "Name",
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w300,
                          ),
                          // prefixText: "+974 |  ",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                elevation: 5,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  leading: Icon(
                    Icons.password,
                    color: HexColor("#01A0C9"),
                  ),
                  title: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        onChanged: (text) {},
                        controller: _passwordController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: const Color(0xFFFFFFFF),
                          hintText: "Password",
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w300,
                          ),
                          // prefixText: "+974 |  ",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        validateAndSave();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: HexColor("#3DB5D4"),
                      ),
                      child: const Text(
                        "SIGN UP",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Color(0xFF575757),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      },
                      child: Text(
                        "SIGN IN",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: HexColor("#3DB5D4"),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
