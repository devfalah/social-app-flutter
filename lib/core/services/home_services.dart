import 'package:socialapp/helper/cache_helper.dart';
import 'package:socialapp/helper/http_helper.dart';
import 'package:socialapp/model/post_model.dart';

class HomeService {
  List<PostModel> posts = [];
  List<PostModel> searchPosts = [];
  getPost() async {
    print("token:" + posts.length.toString());
    var token = await CacheHelper.getData('token');

    final res = await HttpHelper.get(
      path: "posts",
      headers: {
        "Authorization": "Bearer " + token,
      },
    );
    if (res.statusCode == 200) {
      posts = postModelFromJson(res.body);
      print("=====" + res.body);
      print("=====" + posts[0].likes.toString());
      print("token:" + posts.length.toString());
      return posts;
    } else {
      print(res.body);
    }
  }

  searchPost(String searchText) async {
    var token = await CacheHelper.getData('token');
    final res = await HttpHelper.get(
      path: "posts?description_contains=$searchText",
      headers: {
        "Authorization": "Bearer " + token,
      },
    );
    if (res.statusCode == 200) {
      searchPosts = postModelFromJson(res.body);
      print("++++" + res.body);
      print("token:" + posts.length.toString());
      return searchPosts;
    } else {
      print(res.body);
    }
  }

  addLike(Object data) async {
    var token = await CacheHelper.getData('token');
    final res = await HttpHelper.post(
      path: "likes",
      body: data,
      headers: {
        "Authorization": "Bearer " + token,
      },
    );
    if (res.statusCode == 200) {
      print("++++" + res.body);
    } else {
      print(res.body);
    }
  }
}
