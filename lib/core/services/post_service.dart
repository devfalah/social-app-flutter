import 'package:socialapp/helper/helper.dart';

class PostService {
  addPost(data) async {
    var res;
    try {
      var token = await CacheHelper.getData('token');
      res = await HttpHelper.post(
        path: "Posts",
        body: data,
        headers: {
          "Authorization": "Bearer " + token,
        },
      );
    } catch (e) {
      print(e.toString());
    }
    return res;
  }

  addComment(id, content) async {
    var res;
    try {
      var token = await CacheHelper.getData('token');
      var userId = await CacheHelper.getData('id');
      res = await HttpHelper.post(
        path: "comments",
        body: {
          "users_permissions_user": userId.toString(),
          "post": id.toString(),
          "content": content,
        },
        headers: {
          "Authorization": "Bearer " + token,
        },
      );
    } catch (e) {
      print(e.toString());
    }
    return res;
  }
}
