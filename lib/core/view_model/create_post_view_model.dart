import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import 'package:socialapp/core/services/post_service.dart';
import 'package:socialapp/core/view_model/view_model.dart';
import 'package:socialapp/helper/helper.dart';
import 'package:socialapp/view/views.dart';

class PostViewModel extends GetxController {
  String description;
  File image;
  String imageUrl;
  String userImageUrl;
  PostViewModel() {
    ProfileViewModel profileViewModel = Get.find();
    userImageUrl = profileViewModel.user.imageUrl;
  }

  final picker = ImagePicker();
  Future getImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);

    if (pickedFile != null) {
      image = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
    upload();
    update();
  }

  upload() async {
    var token = await CacheHelper.getData('token');
    var uri = Uri.parse("http://192.168.0.114:1337" + "/upload");
    var request = new http.MultipartRequest("POST", uri);

    request.headers.addAll({
      "Authorization": "Bearer " + token,
    });
    var multipartFile =
        await http.MultipartFile.fromPath("files", image.path ?? "");
    request.files.add(multipartFile);
    var response = await request.send();
    response.stream.transform(utf8.decoder).listen((value) {
      var res = json.decode(value);
      imageUrl = res[0]['formats']['thumbnail']['url'];
      print(imageUrl);

      // print(value);
    });
  }

  addPost() async {
    var id = await CacheHelper.getData('id');

    print(description);

    final res = await PostService().addPost({
      "description": description,
      'users_permissions_user': id,
      "imageUrl": imageUrl ?? "",
    });
    if (res.statusCode == 200) {
      print("ok");
      Get.off(ControllView());
    } else {
      print("errors");
      print(res.body);
    }
  }
}
