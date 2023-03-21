import 'package:flutter/material.dart';

import '/libraries/dotted/dotted_border.dart';
import '/res/style.dart';
import '/ui/widgets/button/touchable_opacity.dart';

class DottedBorderWidget extends StatelessWidget {
  final Color? lineColor;
  final double? width;
  final double? height;
  final Color? background;
  final Widget? icon;
  final String? text;
  final VoidCallback? callback;
  final double? radius;
  final TextStyle? textStyle;

  DottedBorderWidget(
      {this.lineColor = Colors.black, this.width, this.height, this.background, this.icon, this.text = "", this.callback, this.radius = 0, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
        child: DottedBorder(
      radius: Radius.circular(radius!),
      padding: EdgeInsets.all(0),
      dashPattern: [6, 2, 6, 2],
      strokeWidth: 2,
      borderType: BorderType.RRect,
      color: lineColor!,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(radius!)), color: const Color(0xfff5f6f8)),
        width: width,
        height: height,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) icon!,
            SizedBox(
              width: 5.ws,
            ),
            Text(text!, style: textStyle, textAlign: TextAlign.left)
          ],
        ),
      ),
    ));
  }
}
