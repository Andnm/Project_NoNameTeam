import 'package:flutter/material.dart';

import '/res/theme/theme_service.dart';
import '../../res/style.dart';

class DataErrorWidget extends StatelessWidget {
  final String? messageError;
  final Function() onReloadData;

  DataErrorWidget({
    this.messageError,
    required this.onReloadData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: getColor().bgThemeColorWhite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.images.imgDataError.image(
            width: 90,
            height: 90,
          ),
          const SizedBox(height: 20),
          Text(
            messageError ?? LocalString.networkError,
            style: text16.textColor141414,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => onReloadData(),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30),
            ),
            child: Text(LocalString.networkReload),
          )
        ],
      ),
    );
  }
}
