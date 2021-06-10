import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:socialapp/helper/helper.dart';
import 'package:socialapp/model/models.dart';
import 'package:socialapp/view/widget/widgets.dart';

import '../views.dart';

class PostCard extends StatelessWidget {
  final PostModel post;

  const PostCard({Key key, this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(UserView(
                  user: post.user,
                ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                      "$mainUrl${post.user.imageUrl}",
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  CustomText(
                    text: post.user.name,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(width: 2.0),
                  if (post.user.isVerfied)
                    Icon(
                      Icons.check_circle,
                      size: 16,
                      color: mainLightColor,
                    ),
                  SizedBox(width: 5.0),
                  CustomText(
                    text: "@" + post.user.username,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: post.description,
                  ),
                  SizedBox(height: 5.0),
                  if (post.image != null && post.image.isNotEmpty)
                    Card(
                      child: Image.network(
                        "$mainUrl${post.image}",
                        height: 300,
                        width: 350,
                        fit: BoxFit.cover,
                      ),
                    ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(FontAwesomeIcons.heart),
                      onPressed: () {},
                    ),
                    CustomText(
                      text: "50 Likes",
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(FontAwesomeIcons.comment),
                      onPressed: () {},
                    ),
                    CustomText(
                      text: "50 comment",
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
