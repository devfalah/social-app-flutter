import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialapp/core/view_model/auth_view_model.dart';
import 'package:socialapp/helper/helper.dart';
import 'package:socialapp/view/views.dart';
import 'package:socialapp/view/widget/widgets.dart';

class LoginView extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GetBuilder<AuthViewModel>(
        init: Get.put(AuthViewModel()),
        builder: (controller) => SingleChildScrollView(
          child: Container(
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
                          text: "LOGIN",
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
                      text: "LOGIN",
                      onPressed: () {
                        _formKey.currentState.save();
                        controller.login();
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
                          text: "Don't have an account? Sign up",
                          onPressed: () {
                            Get.to(RegisterView());
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
