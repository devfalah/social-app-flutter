import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:socialapp/core/view_model/view_model.dart';
import 'package:socialapp/view/widget/widgets.dart';

class SearchView extends StatelessWidget {
  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30.0),
  );
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchViewModel>(
      init: SearchViewModel(),
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 26.0, vertical: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(16.0),
                      prefixIcon: Icon(
                        FontAwesomeIcons.search,
                        size: 16,
                      ),
                      hintText: "Write search word",
                      border: border,
                    ),
                    onSubmitted: (value) {
                      controller.search(value);
                    },
                  ),
                ),
                if (controller.posts.length == 0)
                  Center(child: Text("Not found")),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.posts.length,
                    itemBuilder: (_, index) => PostCard(
                      post: controller.posts[index],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
