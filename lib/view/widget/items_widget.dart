import 'package:flutter/material.dart';
import 'package:socialapp/view/widget/widgets.dart';

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
