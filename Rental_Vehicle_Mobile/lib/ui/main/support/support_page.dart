import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/res/theme/theme_service.dart';
import '/ui/base/base_page.dart';
import '../../../data/storage/data_constant.dart';
import '../../../res/style.dart';
import '../../widgets/button/touchable_circle_opacity.dart';
import '../../widgets/comment_widget.dart';
import '../../widgets/image_widget.dart';
import '../../widgets/like_widget.dart';
import '../../widgets/user_role_widget.dart';
import 'support_controller.dart';

//ignore: must_be_immutable
class SupportPage extends BasePage<SupportController> {
  @override
  Widget buildContentView(BuildContext context, SupportController controller) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 230.ws,
            floating: false,
            pinned: true,
            elevation: 0.0,
            titleSpacing: 0,
            scrolledUnderElevation: 0,
            forceElevated: false,
            centerTitle: true,
            leading: TouchableCircleOpacity(
              icon: Assets.images.imgBack.image(
                width: 24.ws,
                height: 24.ws,
                color: getColor().themeColorWhite,
              ),
              size: 36.ws,
              onPressed: () {
                Get.back();
              },
            ),
            actions: [
              TouchableCircleOpacity(
                icon: Assets.images.imgIconMore.image(
                  width: 24.ws,
                  height: 24.ws,
                  color: getColor().themeColorWhite,
                ),
                size: 36.ws,
                onPressed: () {},
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Positioned.fill(
                    child: RoundNetworkImage(
                      width: double.infinity,
                      height: double.infinity,
                      url: IMAGE_DEMO,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                switch (index) {
                  case 0:
                    return _listContentView();

                  default:
                    return Container();
                }
              }, //ListTile
              childCount: 1,
            ), //SliverChildBuildDelegate
          ),
        ],
      ),
    );
  }

  Widget _listContentView() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.ws),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15.hs,
          ),
          /*TopicWidget(
            topics: controller.item.topics!,
            height: 24.ws,
            icon: Image.asset(
              DImages.iconTopic,
              width: 24.ws,
              height: 24.ws,
            ),
          ),*/
          Text(controller.user.displayName, style: text16.bold.textColor141414, textAlign: TextAlign.left),
          SizedBox(
            height: 13.ws,
          ),
          UserRoleWidget(
            user: controller.user,
            avatarSize: 40.ws,
            createDate: controller.user.dob!,
          ),
          SizedBox(
            height: 12.ws,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              LikeWidget(
                iconSize: 32.ws,
                totalLike: RxInt(12),
                isLike: RxBool(false),
                onFavorite: () {
                  //controller.onChangeFavorite();
                },
              ),
              SizedBox(
                width: 20.ws,
              ),
              CommentWidget(
                iconSize: 32.ws,
                totalComment: RxInt(10),
                onComment: () {
                  //controller.onGotoCommentPage();
                },
              ),
            ],
          ),
          SizedBox(
            height: 10.ws,
          ),
          SizedBox(
            height: 16.ws,
          ),
        ],
      ),
    );
  }
}
