import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../Components/GlobalVariables.dart';
import '../../Components/Spacer.dart';
import '../../Components/texts.dart';
import '../SigninScreen.dart';

showLoadingDialog() {
  Get.dialog(
    Center(
      child: Container(
        height: 60,
        width: 60,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: SizedBox(
               child: 
               CircularProgressIndicator(
                strokeWidth: 3,
              ),
              ),
        ),
      ),
    ),
    // barrierDismissible: false,
  );
}

hideLoadingDialog() {
  Get.back();
}

showExitPopup() {
  Get.dialog(Center(
    child: Container(
      padding: const EdgeInsets.all(20),
      width: Get.width * 0.9,
      height: Get.height * 0.3,
      decoration: ShapeDecoration(
        color: const Color(0xFF000435),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Column(
        children: [
          Material(
              type: MaterialType.transparency,
              child: boldtext(Colors.white, 18, 'Exit App', center: true)),
          vertical(30),
          Material(
            type: MaterialType.transparency,
            child: mediumtext(Colors.white, 14, 'Do you want to exit App?',
                center: true),
          ),
          vertical(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Card(
                  color: Colors.black,
                  elevation: 15,
                  child: Container(
                    width: 100,
                    height: 40,
                    alignment: Alignment.topLeft,
                    child: Center(child: boldtext(Colors.white, 14, "No")),
                  ),
                ),
              ),
              horizental(20),
              GestureDetector(
                onTap: () {
                  SystemNavigator.pop();
                },
                child: Card(
                  color: Colors.black,
                  elevation: 15,
                  child: Container(
                    width: 100,
                    height: 40,
                    alignment: Alignment.topLeft,
                    child: Center(child: boldtext(Colors.white, 14, "Yes")),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  ));
}

showLogoutPopup() {
  Get.dialog(Center(
    child: Container(
      padding: const EdgeInsets.all(20),
      width: Get.width * 0.9,
      height: Get.height * 0.3,
      decoration: ShapeDecoration(
        color: const Color(0xFF000435),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Column(
        children: [
          Material(
              type: MaterialType.transparency,
              child: boldtext(Colors.white, 18, 'Logout', center: true)),
          vertical(30),
          Material(
            type: MaterialType.transparency,
            child: mediumtext(Colors.white, 14, 'Do you want to Logout?',
                center: true),
          ),
          vertical(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Card(
                  color: Colors.black,
                  elevation: 15,
                  child: Container(
                    width: 100,
                    height: 40,
                    alignment: Alignment.topLeft,
                    child: Center(child: boldtext(Colors.white, 14, "No")),
                  ),
                ),
              ),
              horizental(20),
              GestureDetector(
                onTap: () {
                  appStorage.erase();
                  Get.offAll(() => const SigninScreen());
                },
                child: Card(
                  color: Colors.black,
                  elevation: 15,
                  child: Container(
                    width: 100,
                    height: 40,
                    alignment: Alignment.topLeft,
                    child: Center(child: boldtext(Colors.white, 14, "Yes")),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  ));
}