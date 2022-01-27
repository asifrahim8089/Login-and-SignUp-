import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#01A0C9"),
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
          ),
        ),
        title: const Text("Change Password"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
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
                  Icons.email,
                  color: HexColor("#4EDBFF"),
                ),
                title: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "test1@gmail.com",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
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
                  color: HexColor("#4EDBFF"),
                ),
                title: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      onChanged: (text) {},
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: const Color(0xFFFFFFFF),
                        hintText: "Old Password",
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
                  color: HexColor("#4EDBFF"),
                ),
                title: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      onChanged: (text) {},
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: const Color(0xFFFFFFFF),
                        hintText: "New Password",
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
                  color: HexColor("#4EDBFF"),
                ),
                title: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      onChanged: (text) {},
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: const Color(0xFFFFFFFF),
                        hintText: "Retype New Password",
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
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: HexColor("#3DB5D4"),
                    ),
                    child: const Text("SUBMIT",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Color(0xffffffff),
                        )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
