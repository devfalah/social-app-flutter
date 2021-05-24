import 'package:get/get.dart';
import 'package:socialapp/helper/cache_helper.dart';
import 'package:socialapp/helper/http_helper.dart';
import 'package:socialapp/view/views.dart';
import 'dart:convert' as convert;

class AuthViewModel extends GetxController {
  String userName, password, email, name;
  var token;
  AuthViewModel() {
    getToken();
  }
  void onClose() {
    getToken();
    super.onClose();
  }

  bool get isToken => token != null;

  getToken() async {
    token = await CacheHelper.getData('token');
    print(token);
    print(isToken);

    update();
  }

  register() async {
    try {
      var response = await HttpHelper.post(
        path: "auth/local/register",
        body: {
          "username": userName,
          "password": password,
          "email": email,
          "name": name,
        },
      );
      var body = convert.jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(body);

        CacheHelper.putData(key: 'token', value: body['jwt']);
        CacheHelper.putData(key: 'id', value: body['user']['id'].toString());

        Get.offAll(ControllView());
      } else {
        print(body);
        print("error");
      }
    } catch (e) {
      print(e.toString());
    }
    update();
  }

  login() async {
    try {
      var response = await HttpHelper.post(
        path: "auth/local",
        body: {
          "password": password,
          "identifier": email,
        },
      );
      var body = convert.jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(response.body);
        CacheHelper.putData(key: 'token', value: body['jwt']);
        CacheHelper.putData(key: 'id', value: body['user']['id'].toString());
        Get.offAll(ControllView());
      } else {
        print(response.body);
        print("error");
      }
    } catch (e) {
      print(e.toString());
    }
    update();
  }
}
