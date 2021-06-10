import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:socialapp/core/services/post_service.dart';
import 'package:socialapp/core/services/user_service.dart';
import 'package:socialapp/model/comment_model.dart';
import 'package:socialapp/model/models.dart';

class PostDetailViewModel extends GetxController {
  List<CommentModel> comments = [];
  List<UserModel> users = [];

  UserModel user;
  ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);
  ValueNotifier<bool> get isLoading => _isLoading;
  getUser(id) async {
    UserService().getUserDataById(id).then((value) {
      user = value;
      _isLoading.value = false;
      update();
    });
    update();
  }

  addComment(id, content) async {
    PostService().addComment(id, content);
  }

  getCommints(List<dynamic> postComments) async {
    for (int i = 0; i < postComments.length; i++) {
      if (comments[i].id != (postComments[i]['id']))
        comments.add(CommentModel.fromJson(postComments[i]));
      users.add(getUser(postComments[i]['id']));
    }
  }
}
