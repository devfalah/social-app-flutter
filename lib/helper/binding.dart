import 'package:get/get.dart';
import 'package:socialapp/core/view_model/view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => PostViewModel());
    Get.lazyPut(() => ProfileViewModel());
    Get.lazyPut(() => SearchViewModel());
  }
}
