import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:socialapp/helper/helper.dart';
import 'package:socialapp/model/models.dart';
import 'package:socialapp/view/widget/widgets.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomText(
                  text: "@falahhassan",
                ),
                SizedBox(width: 10.0),
                CustomText(
                  text: "Falahhassan",
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(width: 10.0),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(
                    "$mainUrl${post.image}",
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            CustomText(
              text: post.description,
            ),
            Card(
              child: Image.network(
                "$mainUrl${post.image}",
                height: 300,
                width: 350,
                fit: BoxFit.cover,
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
