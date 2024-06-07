import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/Components/Spacer.dart';
import 'package:project/Components/texts.dart';
import 'package:project/View/Widgets/alertboxes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF000435),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            boldtext(Colors.white, 36, "Welcome to Home Screen", center: true),
            vertical(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: Get.width * 0.35, // Set width
                  height: 35, // Set height
                  child: ElevatedButton(
                    onPressed: () {
                      showLogoutPopup();
                    },
                    child: boldtext(Color(0xFF000435), 16, "logout"),
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.35, // Set width
                  height: 35, // Set height
                  child: ElevatedButton(
                    onPressed: () {
                      showExitPopup();
                    },
                    child: boldtext(Color(0xFF000435), 16, "Exit App"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
