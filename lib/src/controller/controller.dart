import 'package:get/get.dart';

class Controller extends GetxController {
  // stores current image index
  RxInt currentImage = 0.obs;
  RxInt imageToShow = 0.obs;

  // function updates current image index
  void updateCurrentIndex(int ind) {
    currentImage.value = ind;
    update();
  }
}
