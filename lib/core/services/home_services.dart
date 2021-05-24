import 'package:socialapp/helper/cache_helper.dart';
import 'package:socialapp/helper/http_helper.dart';
import 'package:socialapp/model/post_model.dart';

class HomeService {
  getPost() async {
    List<PostModel> posts = [];
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
      print("token:" + posts.length.toString());
      return posts;
    } else {
      print(res.body);
    }
  }
}
