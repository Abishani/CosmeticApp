import 'package:cosmetic_app/controllers/auth_controller.dart';
import 'package:cosmetic_app/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => authController.googleSignIn(),
              child: Text("Sign in with Google"),
            ),
            // Obx(() {
            //   if (authController.user.value != null) {
            //     return ElevatedButton(
            //       onPressed: () => Get.to(HomePage()),
            //       child: Text("Continue to Home"),
            //     );
            //   } else {
            //     return Container();
            //   }
            // }),
          ],
        ),
      ),
    );
  }
}
