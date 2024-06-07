import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Components/Spacer.dart';
import '../Components/texts.dart';
import '../Controller/SigninController.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final signIncontroller = Get.put(SignInController());
  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool viewPass = true;
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    usernameController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF000435),
        body: LayoutBuilder(builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      vertical(50),
                      boldtext(Colors.white, 55, 'Sign in'),
                      vertical(50),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: mediumtext(
                              Colors.white,
                              18,
                              'Username',
                            )),
                      ),
                      textarea(usernameController, 'Enter Username ',
                          'Please Enter Username'),
                      vertical(10),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: mediumtext(
                              Colors.white,
                              18,
                              'Password',
                            )),
                      ),
                      textarea(passController, 'Enter Password',
                          'Please Enter Username'),
                      vertical(50),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: SizedBox(
                          width: Get.width * 0.9, // Set width
                          height: 50, // Set height
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                signIncontroller.SendLogin(
                                  usernameController.text,
                                  passController.text,
                                );
                              }
                            },
                            child: boldtext(Color(0xFF000435), 24, "Sign in"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget textarea(
    TextEditingController controller,
    String hint,
    String? message,
    // IconData icon,
    {
    bool? isEnabled,
  }) {
    return SizedBox(
      width: Get.width * 0.9,
      child: TextFormField(
        style: TextStyle(color: Colors.black),
        controller: controller,
        enabled: isEnabled,
        obscureText: hint == "Enter Password" ? viewPass : false,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return message;
          }
          return null;
        },
        obscuringCharacter: "*",
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFF808387), width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFF808387), width: 1)),
          // disabledBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(8),
          //     borderSide: const BorderSide(color: Color(0xFF808387), width: 1)),

          suffixIcon: hint == "Enter Password"
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      viewPass = !viewPass;
                    });
                  },
                  icon: Icon(
                    viewPass ? Icons.visibility : Icons.visibility_off,
                    color: const Color(0xFF808387),
                  ))
              : null,
          // prefixIcon: Icon(icon),
          contentPadding: const EdgeInsets.only(left: 10, top: 15),
          hintText: hint,
          hintStyle: const TextStyle(color: Color(0xFF808387)),
        ),
      ),
    );
  }
}
