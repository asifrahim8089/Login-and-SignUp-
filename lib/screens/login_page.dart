import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login/app_constants.dart';
import 'package:login/screens/home_screen.dart';
import 'package:login/screens/sign_up.dart';
import 'package:login/snack_bar.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool vis = true;
  // ignore: prefer_final_fields
  TextEditingController _usernameController = TextEditingController();
  // ignore: prefer_final_fields
  TextEditingController _passwordController = TextEditingController();

  bool validate = false;
  bool circular = false;
  final storage = const FlutterSecureStorage();

  void validateAndSave() async {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      setState(
        () {
          circular = true;
        },
      );
      Map<String, String> data = {
        "username": _usernameController.text,
        "password": _passwordController.text,
      };

      final Uri url = Uri.https(baseUrl, apiUrl + "/auth/login");
      final response = await http.post(url, body: jsonEncode(data), headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      });
      if (response.statusCode == 200) {
        Map<String, dynamic> output = json.decode(response.body);
        await storage.write(key: "token", value: output["token"]);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
            (route) => false);
      } else {
        showSnackBar(
            duration: const Duration(milliseconds: 1000),
            context: context,
            message: "Invalid Credentials,try again");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
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
                        controller: _usernameController,
                        keyboardType: TextInputType.phone,
                        onChanged: (text) {},
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
                    Icons.lock,
                    color: HexColor("#01A0C9"),
                  ),
                  title: Column(
                    children: [
                      TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.phone,
                        onChanged: (text) {},
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
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.visibility_rounded,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 50, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xFF222121),
                      ),
                    ),
                  ],
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
                        "SIGN IN",
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
                      "Dont't have any account?",
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
                                builder: (context) => const SignUp()));
                      },
                      child: Text(
                        "Create an account",
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
