import 'package:flutter/material.dart';
import 'package:socialapp/model/post_model.dart';
import 'package:socialapp/view/widget/post_card.dart';

class DetailView extends StatelessWidget {
  final PostModel post;

  const DetailView({Key key, this.post}) : super(key: key);
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
