import 'package:get/get.dart';
import 'package:socialapp/core/services/home_services.dart';
import 'package:socialapp/helper/helper.dart';

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

  Future<bool> addLike(String postId) async {
    var userId = await CacheHelper.getData('id');
    try {
      final res = await HomeService().addLike({
        "post": postId,
        "users_permissions_user": userId,
      });
      print(res.body);
      return true;
    } catch (e) {
      return false;
    }
  }
}
