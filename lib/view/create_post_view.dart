import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socialapp/core/view_model/create_post_view_model.dart';
import 'package:socialapp/core/view_model/view_model.dart';
import 'package:socialapp/helper/helper.dart';
import 'package:socialapp/view/views.dart';
import 'package:socialapp/view/widget/widgets.dart';

class CreatePostView extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostViewModel>(
      init: PostViewModel(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            leading: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  color: mainLightColor,
                ),
                onPressed: () {
                  Get.off(ControllView(), transition: Transition.upToDown);
                },
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  width: 80.0,
                  height: 40.0,
                  child: CustomButton(
                    text: "POST",
                    onPressed: () async {
                      _formKey.currentState.save();
                      await controller.addPost();
                    },
                    borderRadius: 40.0,
                  ),
                ),
              )
            ],
          ),
          body: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Image.network(
                        "$mainUrl${controller.userImageUrl}",
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Container(
                        height: 200,
                        child: TextFormField(
                          maxLines: 8,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "What's in your mind?",
                          ),
                          onSaved: (value) {
                            controller.description = value;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.camera_alt),
                      onPressed: () {
                        controller.getImage(ImageSource.camera);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.image_outlined),
                      onPressed: () {
                        controller.getImage(ImageSource.gallery);
                      },
                    ),
                  ],
                ),
                // if (controller.image != null) Image.file(controller.image),
              ],
            ),
          ),
        );
      },
    );
  }
}
