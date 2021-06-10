import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:socialapp/core/view_model/home_view_model.dart';
import 'package:socialapp/helper/helper.dart';
import 'package:socialapp/view/widget/widgets.dart';

import 'views.dart';

class TopPostView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Icon(
          FontAwesomeIcons.fan,
          color: mainLightColor,
        ),
        elevation: 0.0,
      ),
      body: GetBuilder<HomeViewModel>(
        init: Get.find(),
        builder: (controller) => (controller.posts.length < 8)
            ? Center(
                child: Container(
                  child: CustomText(
                    text: "No post",
                  ),
                ),
              )
            : ListView.separated(
                physics: BouncingScrollPhysics(),
                reverse: true,
                itemCount: 8,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(
                        DetailView(
                          post: controller.posts[index],
                        ),
                        transition: Transition.fade,
                      );
                    },
                    child: PostCard(post: controller.posts[index]),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(height: 2.0),
              ),
      ),
    );
  }
}
