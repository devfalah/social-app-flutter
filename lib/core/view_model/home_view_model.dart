import 'package:get/get.dart';
import 'package:socialapp/core/services/home_services.dart';

class HomeViewModel extends GetxController {
  List posts = [];

  HomeViewModel() {
    getData();
  }
  getData() async {
    try {
      posts = await HomeService().getPost();

      print(posts.length);
    } catch (e) {}
    update();
  }
}
