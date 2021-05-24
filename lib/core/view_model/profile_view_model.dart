import 'package:get/get.dart';
import 'package:socialapp/core/services/user_service.dart';
import 'package:socialapp/model/models.dart';

class ProfileViewModel extends GetxController {
  ProfileViewModel() {
    getProfileData();
  }
  var user = UserModel();
  getProfileData() async {
    user = await UserService().getUserData();
    print(user.username);
  }
}
