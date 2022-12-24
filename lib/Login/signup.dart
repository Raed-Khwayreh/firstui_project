// ignore_for_file: prefer_const_constructors, must_be_immutable
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firstui_project/Login/signin.dart';
import 'package:firstui_project/Helpers/textfielddesign.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Helpers/funvalid.dart';
import '../Providers/signprovider.dart';
import '../mainpage.dart';
import '../Helpers/slideanimation.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  Color color = Color.fromARGB(255, 37, 179, 136);
  bool bol = true;
  Icon ico = Icon(
    Icons.remove_red_eye,
    color: Color.fromARGB(255, 254, 151, 0),
  );
  @override
  Widget build(BuildContext context) {
    return Consumer<SignProvider>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.fromLTRB(25, 70, 25, 0),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          provider.reset();
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_rounded,
                        )),
                    SizedBox(
                      width: 55,
                    ),
                    textStyle(
                      "Create your account",
                      20,
                      FontWeight.w500,
                      Color.fromARGB(255, 0, 0, 0),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
                Form(
                  key: formstate,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textStyle(
                        "Name",
                        14,
                        FontWeight.w500,
                        Color.fromARGB(255, 0, 0, 0),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFieldDesign((val) {
                        return validInput(val!, 3, 20, "name");
                      }, name, TextInputType.name, "Raed Khwayreh", false,
                          true),
                      SizedBox(
                        height: 5,
                      ),
                      textStyle(
                        "Email",
                        14,
                        FontWeight.w500,
                        Color.fromARGB(255, 0, 0, 0),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFieldDesign((val) {
                        return validInput(val!, 0, 0, "email");
                      }, email, TextInputType.emailAddress, "raed@gmail.com",
                          false, true),
                      SizedBox(
                        height: 5,
                      ),
                      textStyle(
                        "Phone",
                        14,
                        FontWeight.w500,
                        Color.fromARGB(255, 0, 0, 0),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFieldDesign((val) {
                        return validInput(val!, 0, 0, "phone");
                      }, phone, TextInputType.name, "0599999999", false, true),
                      SizedBox(
                        height: 5,
                      ),
                      textStyle(
                        "Password",
                        14,
                        FontWeight.w500,
                        Color.fromARGB(255, 0, 0, 0),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFieldDesign((val) {
                        return validInput(val!, 6, 20, "password");
                      }, password, TextInputType.name, "**********",
                          provider.hidePassSignUp, true),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (formstate.currentState!.validate()) {
                      if (await provider.signUp(
                          name.text, email.text, phone.text, password.text)) {
                        Navigator.push(
                          context,
                          SliderAnimation(Page: MainPage()),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    backgroundColor: Color.fromARGB(255, 254, 151, 0),
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 135,
                    ),
                  ),
                  child: textStyle(
                    "Sign up",
                    18,
                    FontWeight.w400,
                    Colors.white,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignIn(),
                      ),
                    );
                  },
                  child: textStyle(
                    "Already have an account",
                    13,
                    FontWeight.normal,
                    Color.fromARGB(255, 254, 151, 0),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Text textStyle(String text, double size, FontWeight fontWeight, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontFamily: "Prompt",
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
