import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/app_pages.dart';
import '/data/api/models/topic_item.dart';
import '/res/style.dart';
import '/ui/widgets/button/touchable_opacity.dart';

class TopicWidget extends GetWidget {
  final Widget? icon;
  final List<TopicItem> topics;
  final double? height;

  const TopicWidget({this.icon, required this.topics, this.height = 26});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height!,
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          if (icon != null) icon!,
          if (icon != null)
            SizedBox(
              width: 8.rs,
            ),
          Container(
            height: 50.ws,
            width: 305.ws,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: false,
                itemBuilder: (context, index) {
                  return TouchableOpacity(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        topics[index].name!,
                        style: text14.medium.textColorPrimary,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed(AppRoutes.TOPIC_DISCOVER, arguments: [topics[index].id, topics[index].name]);
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return Center(
                    child: Text(
                      ", ",
                      style: text14.medium.textColorPrimary,
                    ),
                  );
                },
                itemCount: topics.length),
          )
        ],
      ),
    );
  }
}
