import 'package:socialapp/helper/helper.dart';
import 'package:socialapp/model/models.dart';

class UserService {
  Future<UserModel> getUserData() async {
    var token = await CacheHelper.getData('token');
    final res = await HttpHelper.get(
      path: "users/me/",
      headers: {
        "Authorization": "Bearer " + token,
      },
    );
    if (res.statusCode == 200) {
      var user = UserModel.fromJson(res.body);
      print(user.username);
      return user;
    } else {
      print(res.body);
      print("error");
    }
  }
}
