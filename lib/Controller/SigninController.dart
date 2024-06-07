import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import '../Components/GlobalVariables.dart';
import '../Components/Snackbar.dart';
import '../View/HomeScreen.dart';
import '../View/Widgets/alertboxes.dart';

class SignInController extends GetxController {
  SendLogin(String username, String pass) async {
    showLoadingDialog();
    try {
      var response = await http.post(
        Uri.parse('https://qa.admin.bedigitalise.com/app/api/v1/Account/Login'),
        headers: {
          'accept': 'text/plain',
          'X-Tenant-Id': 'clearvision',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'userName': username, 'password': pass}),
      );

      if (response.statusCode == 200) {
        hideLoadingDialog();
        Map<String, dynamic> data = jsonDecode(response.body);
        appStorage.write('token', data['data']['accessToken']);
        Get.to(() => const HomeScreen());
      } else {
        hideLoadingDialog();
        showInSnackBar("Something went wrong",
            color: Colors.red, icon: CupertinoIcons.clear_circled);
      }
    } catch (e) {
      print('errorr  $e');
      hideLoadingDialog();
    }
  }
}
