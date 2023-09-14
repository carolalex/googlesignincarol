import 'package:flutter/material.dart';
import 'package:fluttersignin/login_controler.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Center(
        child: Obx(() {
          if (controller.googleAccount.value == null) {
            print('first');
            return buildLoginButton();
          } else {
            return buildProfileview();
          }
         }
        ),
      ),
    );
  }

  Column buildProfileview() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundImage:
              Image.network(controller.googleAccount.value?.photoUrl ?? '')
                  .image,
          radius: 100,
        ),
        Text(controller.googleAccount.value?.displayName ?? ''),
        Text(controller.googleAccount.value?.email ?? ''),
        ElevatedButton(
            onPressed: () {
              controller.logout();
            },
            child: Text("Logout"))
      ],
    );
  }

  FloatingActionButton buildLoginButton() {
    return FloatingActionButton.extended(
      onPressed: () {
        print("sss");
        controller.login();
      },
      icon: CircleAvatar(radius: 20, child: Image.asset('images/google.jpg')),
      label: const Text("Sign in with Google"),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    );
  }
}
