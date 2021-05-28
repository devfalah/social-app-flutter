import 'package:get/get.dart';
import 'package:socialapp/core/services/home_services.dart';
import 'package:socialapp/model/models.dart';

class SearchViewModel extends GetxController {
  List<PostModel> posts = [];
  search(String searchText) async {
    posts = await HomeService().searchPost(searchText);

    update();
  }
}
