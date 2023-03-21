import 'dart:ui' as ui show PlaceholderAlignment;

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rental/ui/main/notification/noti_controller.dart';

import '/res/theme/theme_service.dart';
import '../../../data/api/models/response/notification/notification_item.dart';
import '../../../res/style.dart';
import '../../base/base_list_page.dart';
import '../../widgets/image_widget.dart';

//ignore: must_be_immutable
class NotificationPage extends BaseListPage<NotificationItem, NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: EdgeInsets.only(left: 16.ws),
            child: Assets.images.imgBack.image(),
          ),
        ),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: _buildTitleAppBar(context),
        actions: [
          _rightAction(context),
        ],
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: super.build(context),
    );
  }

  Widget _buildTitleAppBar(BuildContext context) {
    return Obx(
      () => DropdownButtonHideUnderline(
        child: DropdownButton2(
          customButton: RichText(
            text: TextSpan(children: [
              TextSpan(text: controller.selectedMenu.value + " ", style: text18.bold.textColor141414),
              WidgetSpan(
                alignment: ui.PlaceholderAlignment.middle,
                child: Assets.images.imgArrowBottom.image(width: 18.ws, height: 18.ws),
              ),
            ]),
          ),
          buttonStyleData: const ButtonStyleData(
            height: 50,
            width: 100,
            padding: EdgeInsets.only(left: 5, right: 5),
            elevation: 2,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
            padding: const EdgeInsets.only(left: 10, right: 5),
          ),
          dropdownStyleData: DropdownStyleData(
            isFullScreen: true,
            maxHeight: 250.ws,
            width: 180.ws,
            padding: null,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: getColor().themeColorWhite,
            ),
            elevation: 8,
            offset: const Offset(-20, 0),
            scrollbarTheme: ScrollbarThemeData(
              radius: const Radius.circular(20),
              thickness: MaterialStateProperty.all<double>(6),
              thumbVisibility: MaterialStateProperty.all<bool>(true),
            ),
          ),
          style: text18.bold.textColor777777,
          items: controller.menu
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Row(
                      children: [
                        Text(
                          item,
                          style: text16.textColor141414,
                        ),
                      ],
                    ),
                  ))
              .toList(),
          value: controller.selectedMenu.value,
          onChanged: (value) {
            controller.selectedMenu.value = value as String;
          },
          alignment: AlignmentDirectional.center,
        ),
      ),
    );
    // return InkWell(
    //   onTap: () {},
    //   child: Padding(
    //     padding: EdgeInsets.all(5.0),
    //     child: RichText(
    //       text: TextSpan(children: [
    //         TextSpan(
    //             text: "Tất cả hoạt động", style: text18.bold.textBlackColor),
    //         WidgetSpan(
    //             alignment: ui.PlaceholderAlignment.middle,
    //             child: Image.asset(
    //               DImages.arrowBottom,
    //               width: 18,
    //               height: 18,
    //             )),
    //       ]),
    //     ),
    //   ),
    // );
  }

  Widget _rightAction(BuildContext context) {
    return IconButton(
      iconSize: 32,
      padding: EdgeInsets.only(right: 16.ws),
      icon: Assets.images.imgCheckNoti.image(
        width: 32.ws,
        height: 32.ws,
      ),
      onPressed: () async {},
    );
  }

  @override
  Widget buildItem(BuildContext context, NotificationItem item, int index) {
    Widget itemBuild;
    switch (item.type) {
      case "account":
        itemBuild = _buildAccountItem(context, item, index);
        break;
      case "payment":
        itemBuild = _buildSystemItem(context, item, index, icon: Assets.images.imgNotiPayment.path);
        break;
      default:
        itemBuild = _buildSystemItem(context, item, index);
        break;
    }
    return Obx(
      () => InkWell(
        onTap: () {
          if (item.isRead?.value == false) {
            item.isRead?.value = true;
          }
        },
        child: Container(
          color: item.isRead?.value == true ? getColor().themeColorWhite : getColor().themeColorE5F2FF,
          child: itemBuild,
        ),
      ),
    );
  }

  Widget _buildSystemItem(BuildContext context, NotificationItem item, int index, {String? icon}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.ws, right: 13.ws, top: 16.ws),
          child: Image.asset(
            icon ?? Assets.images.imgNotiDiscount.path,
            height: 40.ws,
            width: 40.ws,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              Text(
                item.title ?? "",
                style: text16.medium.textColor141414,
              ),
              SizedBox(
                height: 5.ws,
              ),
              Text(
                item.content ?? "",
                style: text14.textColor141414,
              ),
              SizedBox(
                height: 5.ws,
              ),
              Text(
                "12 giờ trước",
                style: text12.textColor777777,
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildAccountItem(BuildContext context, NotificationItem item, int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.ws, right: 13.ws, top: 16.ws),
          child: RoundNetworkImage(
            width: 40.ws,
            height: 40.ws,
            url: item.image,
            radius: 20,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              Text(
                item.content ?? "",
                style: text16.medium.textColor141414,
              ),
              SizedBox(
                height: 5.ws,
              ),
              Text(
                "12 giờ trước",
                style: text12.textColorB2B2B2,
              ),
              const SizedBox(height: 16),
            ],
          ),
        )
      ],
    );
  }
}
