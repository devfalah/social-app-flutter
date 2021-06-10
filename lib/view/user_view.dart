import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:socialapp/helper/helper.dart';
import 'package:socialapp/model/models.dart';
import 'package:socialapp/view/widget/widgets.dart';

class UserView extends StatelessWidget {
  final _panelController = PanelController();
  final UserModel user;

  UserView({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          mainUrl + user.imageUrl,
          fit: BoxFit.fill,
        ),
        panelBuilder: (ScrollController scroll) => Column(
          children: [
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
                          name: user.name,
                          userName: user.username,
                          isVerfied: user.isVerfied ?? false,
                        ),
                        SizedBox(height: 20.0),
                        CustomText(text: user.bio),
                        SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildRow({String name, String userName, bool isVerfied}) {
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
                  if (isVerfied)
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
