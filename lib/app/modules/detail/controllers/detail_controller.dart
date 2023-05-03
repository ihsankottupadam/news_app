import 'package:get/get.dart';
import 'package:news_app/app/data/models/news_model.dart';

class DetailController extends GetxController {
  late NewsModel news;
  @override
  void onInit() {
    super.onInit();
    news = Get.arguments as NewsModel;
  }
}
