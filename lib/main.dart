import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialapp/view/views.dart';

import 'core/view_model/view_model.dart';
import 'helper/helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ProfileViewModel());
  // CacheHelper.removeData('token');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      title: 'Social App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(body: ControllView()),
    );
  }
}
