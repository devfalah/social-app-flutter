import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:socialapp/core/services/user_service.dart';
import 'package:socialapp/model/models.dart';

class ProfileViewModel extends GetxController {
  ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);
  ValueNotifier<bool> get isLoading => _isLoading;
  ProfileViewModel() {
    getProfileData();
  }
  var user = UserModel();
  Future<UserModel> getProfileData() async {
    _isLoading.value = true;
    UserService().getUserData().then((value) {
      user = value;

      _isLoading.value = false;
      update();
      return user;
    });
    update();
    return user;
  }
}
