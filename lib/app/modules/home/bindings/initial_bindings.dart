import 'package:get/get.dart';
import 'package:news_app/app/modules/signin/controllers/auth_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
  }
}
