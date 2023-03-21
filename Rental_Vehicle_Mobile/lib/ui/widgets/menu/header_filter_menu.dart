import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/res/style.dart';
import '/res/theme/theme_service.dart';
import '/ui/widgets/button/touchable_opacity.dart';

class HeaderFilterMenu extends GetWidget {
  final double? height;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final VoidCallback? onMenuCallback;
  final VoidCallback? onFilterCallback;
  final VoidCallback? onSortCallback;

  HeaderFilterMenu({this.height, this.padding, this.textStyle, this.onMenuCallback, this.onFilterCallback, this.onSortCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      height: height,
      color: getColor().themeColorWhite,
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TouchableOpacity(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Assets.images.imgIconMenu.image(
                  width: 26.ws,
                  height: 26.ws,
                ),
                SizedBox(
                  width: 8.ws,
                ),
                Text(
                  'Danh mục',
                  style: textStyle,
                ),
              ],
            ),
            onPressed: () {
              if (onMenuCallback != null) onMenuCallback!();
            },
          ),
          VerticalDivider(
            width: 1,
            color: getColor().themeColorEBEBEC,
          ),
          TouchableOpacity(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Assets.images.imgIconFilter.image(
                  width: 26.ws,
                  height: 26.ws,
                ),
                SizedBox(
                  width: 8.ws,
                ),
                Text(
                  'Bộ lọc',
                  style: textStyle,
                ),
              ],
            ),
            onPressed: () {
              if (onFilterCallback != null) onFilterCallback!();
            },
          ),
          VerticalDivider(
            width: 1,
            color: getColor().themeColorEBEBEC,
          ),
          TouchableOpacity(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Assets.images.imgIconSort.image(
                  width: 26.ws,
                  height: 26.ws,
                ),
                SizedBox(
                  width: 8.ws,
                ),
                Text(
                  'Sắp xếp',
                  style: textStyle,
                ),
              ],
            ),
            onPressed: () {
              if (onSortCallback != null) onSortCallback!();
            },
          )
        ],
      ),
    );
  }
}
