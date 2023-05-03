import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _auth.userChanges().listen((user) {
      if (user == null) {
        Get.offAllNamed(Routes.SIGNIN);
      } else {
        Get.offAllNamed(Routes.HOME);
      }
    });
  }
}
