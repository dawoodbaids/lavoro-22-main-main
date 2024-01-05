import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../data/provider/user_firebase.dart';

import '../../../routes/app_pages.dart';

class SigninController extends GetxController {
  // final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  Future<bool> login(String email, String password) async {
    try {
       isLoading = true;
    update();
      await auth.signInWithEmailAndPassword(email: email, password: password);
      
      await DatabaseFirestore.getUser();

      Get.offAllNamed(Routes.HOME);
 isLoading = false;
    update();
      return true;
    } on FirebaseAuthException catch (e) {
isLoading = false;
    update();
      String errorMessage = 'Error Occurred During Login Please Try Again Later';

      switch (e.code) {
        case 'invalid-email':
          errorMessage = 'Invalid Email Address Please Enter A Valid Email';
          break;
        case 'user-disabled':
          errorMessage = 'This user account has been disabled';
          break;
        case 'user-not-found':
 errorMessage = 'user-not-found';
          break;    
        case 'wrong-password':
          errorMessage = 'invalid Eail Or Password Please Check Your Credentials';
          break;
        default:
     errorMessage = 'Error: ${e.message}';
      }

      Get.snackbar(
        "About Login".tr,
        "Login Message".tr,
        backgroundColor: Colors.redAccent,
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          'Login Failed'.tr,
          style: const TextStyle(color: Colors.white),
        ),
        messageText: Text(
          errorMessage,
          style: const TextStyle(color: Colors.white),
        ),
      );

      return false;
    }
  }

  void goToSignUpView() => Get.toNamed(Routes.SIGNUP);
}
