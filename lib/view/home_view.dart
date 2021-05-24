import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialapp/core/view_model/home_view_model.dart';
import 'package:socialapp/view/widget/widgets.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<HomeViewModel>(
        init: HomeViewModel(),
        builder: (controller) => ListView.separated(
          // reverse: true,
          itemCount: controller.posts.length,
          itemBuilder: (_, index) {
            return PostCard(post: controller.posts[index]);
          },
          separatorBuilder: (BuildContext context, int index) =>
              Divider(height: 2.0),
        ),
      ),
    );
  }
}
