import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:socialapp/core/view_model/view_model.dart';
import 'package:socialapp/helper/helper.dart';
import 'package:socialapp/model/models.dart';
import 'package:socialapp/view/widget/widgets.dart';

class ProfileView extends StatelessWidget {
  final _panelController = PanelController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: Get.put(ProfileViewModel()),
      builder: (controller) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        body: SlidingUpPanel(
          controller: _panelController,
          maxHeight: 400.0,
          minHeight: 150.0,
          parallaxEnabled: true,
          color: Colors.transparent,
          parallaxOffset: 0.5,
          body: Image.network(
            "$mainUrl${controller.user.imageUrl}",
            fit: BoxFit.fill,
          ),
          panelBuilder: (ScrollController scroll) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
                child: ItemsWidget(),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildRow(
                            name: controller.user.name,
                            userName: controller.user.username,
                            IsVerfied: controller.user.isVerfied ?? false,
                          ),
                          SizedBox(height: 20.0),
                          CustomText(text: controller.user.bio),
                          SizedBox(height: 20.0),
                          // CustomText(
                          //   text: "My posts",
                          //   color: mainLightColor,
                          //   fontSize: 20.0,
                          //   fontWeight: FontWeight.bold,
                          // ),
                          // SizedBox(height: 20.0),
                          // Expanded(
                          //   child: ListView.separated(
                          //     itemBuilder: (_, index) => PostCard(
                          //       post: PostModel(
                          //           id: 1,
                          //           description: "Hello",
                          //           image:
                          //               "/uploads/image_picker1346974046291929250_39377a95e3.jpg"),
                          //     ),
                          //     separatorBuilder: (_, index) => Container(),
                          //     itemCount: 10,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildRow({String name, String userName, bool IsVerfied}) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomText(
                    text: name,
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(width: 4.0),
                  if (IsVerfied)
                    Icon(
                      Icons.check_circle,
                      size: 20,
                      color: mainLightColor,
                    ),
                ],
              ),
              SizedBox(height: 4.0),
              CustomText(
                text: "@" + userName,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        FloatingActionButton(
          child: Icon(Icons.people),
          backgroundColor: mainLightColor,
          onPressed: () {},
        ),
      ],
    );
  }
}

class ItemsWidget extends StatelessWidget {
  const ItemsWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildItemColumn(),
        buildItemColumn(),
        buildItemColumn(),
      ],
    );
  }

  Widget buildItemColumn() {
    return Column(
      children: [
        CustomText(
          text: "1400",
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 4.0),
        CustomText(
          text: "Follwoers",
          color: Colors.white,
        ),
      ],
    );
  }
}
