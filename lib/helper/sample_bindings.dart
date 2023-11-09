
import 'package:get/get.dart';

import '../controller/user_controller.dart';
import '../controller/game_controller.dart';
import '../controller/result_controller.dart';

class SampleBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>((() => UserController()));
    Get.lazyPut<GameController>((() => GameController()));
    Get.lazyPut<ResultController>((() => ResultController()));
  }
}
