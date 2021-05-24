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
}
