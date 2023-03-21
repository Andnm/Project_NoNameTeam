import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '/res/theme/theme_service.dart';
import '/ui/widgets/button/touchable_opacity.dart';
import '../../res/style.dart';

class CommentWidget extends GetWidget {
  final RxInt totalComment;
  final double iconSize;
  final VoidCallback? onComment;

  CommentWidget({required this.totalComment, this.iconSize = 32, this.onComment});

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      child: Row(
        children: [
          Assets.images.imgIconComment.image(
            width: iconSize,
            height: iconSize,
            color: getColor().themeColorB2B2B2,
          ),
          Obx(() => Text("${totalComment.value} bình luận", style: text14.textColor777777, textAlign: TextAlign.left))
        ],
      ),
      onPressed: () {
        if (onComment != null) onComment!();
      },
    );
  }
}
