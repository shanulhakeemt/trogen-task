import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  int currentInx = 0;
  void updateCurrentInx(int inx) {
    currentInx = inx;
    update();
  }
}
