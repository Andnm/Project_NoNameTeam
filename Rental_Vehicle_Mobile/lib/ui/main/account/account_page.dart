import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/app_controller.dart';
import '/res/style.dart';
import '/res/theme/theme_service.dart';
import '/ui/base/base_page.dart';
import '/ui/main/account/account_controller.dart';
import '/ui/main/account/account_item_view.dart';
import '/ui/widgets/button/touchable_opacity.dart';
import '/ui/widgets/image_widget.dart';

//ignore: must_be_immutable
class AccountPage extends BasePage<AccountController> {
  @override
  Widget buildContentView(BuildContext context, AccountController controller) {
    return Scaffold(
      backgroundColor: getColor().bgThemeColorF5F6F8,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 140.ws,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                color: getColor().themeColor0060E0, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15.ws), bottomRight: Radius.circular(15.ws))),
            child: _buildAppbar(),
          ),
          SizedBox(
            height: 23.ws,
          ),
          _buildContent(),
          SizedBox(
            height: 16.ws,
          ),
          _buildLogout()
        ],
      ),
    );
  }

  Widget _buildAppbar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.ws, vertical: 16.ws),
      alignment: Alignment.bottomLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            width: 56,
            height: 56,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(28.ws)),
                border: Border.all(
                  color: getColor().themeColorPrimary,
                  width: 1,
                )),
            child: AvatarNetworkImage(
              width: 50.ws,
              height: 50.ws,
              url: controller.user.displayAvatar ?? "--",
              radius: 25.ws,
              userName: controller.user.displayName,
            ),
          ),
          SizedBox(
            width: 16.ws,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(controller.user.displayName, style: text22.medium.textColorWhite),
              SizedBox(
                height: 5.ws,
              ),
              Text("Thông tin của tôi", style: text14.textColorWhite)
            ],
          )
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.ws),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8.ws),
        ),
        color: getColor().themeColorWhite,
      ),
      child: Column(
        children: [
          AccountItemView(
              icon: Assets.images.imgIconProfile.image(
                width: 32.ws,
                height: 32.ws,
              ),
              title: "Thông tin thường dùng",
              onPressed: () {}),
          Divider(
            height: 1,
          ),
          AccountItemView(
              icon: Assets.images.imgIconNoti.image(
                width: 32.ws,
                height: 32.ws,
              ),
              title: "Thông báo",
              onPressed: () {
                controller.onGotoNotificationsPage();
              }),
          Divider(
            height: 1,
          ),
          AccountItemView(
              icon: Assets.images.imgIconReview.image(
                width: 32.ws,
                height: 32.ws,
              ),
              title: "Đánh giá của tôi",
              onPressed: () {}),
          Divider(
            height: 1,
          ),
          AccountItemView(
              icon: Assets.images.imgIconCard.image(
                width: 32.ws,
                height: 32.ws,
              ),
              title: "Thông tin thanh toán",
              onPressed: () {}),
          Divider(
            height: 1,
          ),
          AccountItemView(
              icon: Assets.images.imgIconSetting.image(
                width: 32.ws,
                height: 32.ws,
              ),
              title: "Cài đặt",
              onPressed: () {}),
          Divider(
            height: 1,
          ),
          AccountItemView(
              icon: Assets.images.imgIconLanguage.image(
                width: 32.ws,
                height: 32.ws,
              ),
              title: "Ngôn ngữ",
              onPressed: () {}),
          Divider(
            height: 1,
          ),
          AccountItemView(
              icon: Assets.images.imgIconQa.image(
                width: 32.ws,
                height: 32.ws,
              ),
              title: "Câu hỏi thường gặp",
              onPressed: () {}),
          Divider(
            height: 1,
          ),
          AccountItemView(
              icon: Assets.images.imgIconLanguage.image(
                width: 32.ws,
                height: 32.ws,
              ),
              title: "Hỗ trợ",
              onPressed: () {}),
        ],
      ),
    );
  }

  Widget _buildLogout() {
    return TouchableOpacity(
      child: Container(
        height: 48.ws,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8.ws),
          ),
          color: getColor().themeColorWhite,
        ),
        margin: EdgeInsets.symmetric(horizontal: 16.ws),
        padding: EdgeInsets.symmetric(horizontal: 10.ws, vertical: 8.ws),
        child: Row(
          children: [
            Assets.images.imgIconLogout.image(
              width: 32.ws,
              height: 32.ws,
            ),
            SizedBox(
              width: 10.ws,
            ),
            Text("Đăng xuất", style: text16.textColor141414),
            Spacer(),
            Assets.images.imgNext.image(
              width: 32.ws,
              height: 32.ws,
            ),
          ],
        ),
      ),
      onPressed: () {
        Get.find<AppController>().logout();
      },
    );
  }
}
