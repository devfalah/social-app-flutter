import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialapp/core/view_model/auth_view_model.dart';
import 'package:socialapp/helper/helper.dart';
import 'package:socialapp/view/widget/widgets.dart';

import '../views.dart';

class RegisterView extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<AuthViewModel>(
          init: Get.put(AuthViewModel()),
          builder: (controller) => Container(
            height: height,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  ClipPath(
                    clipper: CurveCliper(),
                    child: Container(
                      color: mainLightColor,
                      height: height / 2.7,
                      child: Center(
                        child: CustomText(
                          text: "REGISTER",
                          fontSize: 34.4,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15.0),
                    child: CustomTextFormField(
                      hintText: "Full Name",
                      iconData: Icons.email,
                      onSaved: (value) {
                        controller.name = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15.0),
                    child: CustomTextFormField(
                      hintText: "User Name",
                      iconData: Icons.email,
                      onSaved: (value) {
                        controller.userName = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15.0),
                    child: CustomTextFormField(
                      hintText: "Email",
                      iconData: Icons.email,
                      onSaved: (value) {
                        controller.email = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15.0),
                    child: CustomTextFormField(
                      hintText: "Password",
                      obscureText: true,
                      iconData: Icons.lock,
                      onSaved: (value) {
                        controller.password = value;
                      },
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 60.0),
                    height: 45.0,
                    width: double.infinity,
                    child: CustomButton(
                      text: "REGISTER",
                      onPressed: () {
                        _formKey.currentState.save();
                        controller.register();
                      },
                      borderRadius: 10.0,
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Container(
                        height: 80.0,
                        width: double.infinity,
                        child: CustomButton(
                          text: "if you have an account? Login ",
                          onPressed: () {
                            Get.to(LoginView());
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
