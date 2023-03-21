import 'package:flutter/material.dart';

import '/res/theme/theme_service.dart';
import '../../res/style.dart';

class DataEmptyWidget extends StatelessWidget {
  final Color? background;

  DataEmptyWidget({this.background});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: background ?? getColor().bgThemeColorWhite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.images.imgIcEmpty.image(
            width: 120,
            height: 120,
          ),
          const SizedBox(height: 10),
          Text(
            LocalString.networkEmpty,
            style: text16.textColor141414,
          )
        ],
      ),
    );
  }
}
