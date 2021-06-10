import 'package:flutter/material.dart';
import 'package:socialapp/model/models.dart';

import 'package:socialapp/model/post_model.dart';
import 'package:socialapp/view/widget/post_card.dart';
import 'package:socialapp/view/widget/widgets.dart';

class DetailView extends StatelessWidget {
  final PostModel post;

  DetailView({this.post});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          PostCard(
            post: post,
          ),
        ],
      ),
    );
  }
}
