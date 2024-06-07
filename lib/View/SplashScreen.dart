import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/View/HomeScreen.dart';
import 'package:project/View/SigninScreen.dart';
import '../Components/GlobalVariables.dart';
import '../Components/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTokken();
  }

  bool isLoading = false;
  getTokken() async {
    if (appStorage.read("token") != null) {
      setState(() {
        isLoading = true;
        userToken = appStorage.read("token");
        print(userToken);
      });

      Future.delayed(Duration(seconds: 4), () {
        Get.offAll(() => HomeScreen());
      });
    } else {
      Future.delayed(
          Duration(seconds: 4), () => {Get.to(() => SigninScreen())});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [
              Color(0xFF000435),
              Colors.white.withOpacity(0.7599999904632568),
            ],
          ),
        ),
        child: Center(
            child: Image(
          image: AssetImage(AppImages.logo),
          height: Get.height * 0.25,
        )),
      ),
    );
  }
}
