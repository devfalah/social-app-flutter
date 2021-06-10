import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialapp/core/view_model/auth_view_model.dart';
import 'package:socialapp/core/view_model/controll_view.model.dart';
import 'package:socialapp/helper/helper.dart';
import 'package:socialapp/view/views.dart';

class ControllView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthViewModel>(
      init: AuthViewModel(),
      builder: (authController) {
        return authController.isToken == false
            ? LoginView()
            : GetBuilder<ControlViewModel>(
                init: Get.put(ControlViewModel()),
                builder: (controller) => Scaffold(
                  body: controller.currentView,
                  floatingActionButton: FloatingActionButton(
                    heroTag: "btn1",
                    backgroundColor: mainLightColor,
                    elevation: 0.0,
                    child: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        Get.off(
                          CreatePostView(),
                          transition: Transition.downToUp,
                        );
                      },
                    ),
                    onPressed: () {},
                  ),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerDocked,
                  bottomNavigationBar:
                      buildAnimatedBottomNavigationBar(controller),
                ),
              );
      },
    );
  }

  AnimatedBottomNavigationBar buildAnimatedBottomNavigationBar(
      ControlViewModel controller) {
    return AnimatedBottomNavigationBar(
      splashColor: mainDarkColor,
      activeColor: mainLightColor,
      iconSize: 30.0,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      leftCornerRadius: 10,
      rightCornerRadius: 10,
      icons: [
        Icons.home,
        Icons.search,
        Icons.whatshot_outlined,
        Icons.person,
      ],
      activeIndex: controller.navigatorValue,
      onTap: (int index) {
        controller.changeSelectedValue(index);
      },
    );
  }
}
