import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialapp/view/views.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;
  Widget currentView = HomeView();

  int get navigatorValue => _navigatorValue;
  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        currentView = HomeView();
        break;
      case 1:
        currentView = SearchView();
        break;
      case 2:
        currentView = TopPostView();
        break;
      case 3:
        currentView = ProfileView();
        break;
    }
    update();
  }
}
