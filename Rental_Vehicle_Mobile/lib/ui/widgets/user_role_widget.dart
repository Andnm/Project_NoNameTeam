import 'package:flutter/material.dart';
import 'package:rental/ui/widgets/button/touchable_opacity.dart';
import 'package:rental/ui/widgets/icon/icons_component.dart';
import 'package:url_launcher/url_launcher.dart';

import '/res/style.dart';
import '/res/theme/theme_service.dart';
import '../../data/api/models/response/user/TUser.dart';
import 'image_widget.dart';

class UserRoleWidget extends StatelessWidget {
  final TUser user;
  final double? avatarSize;
  final String createDate;

  const UserRoleWidget({required this.user, this.avatarSize = 56, required this.createDate});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          alignment: Alignment.center,
          width: avatarSize,
          height: avatarSize,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(28.ws)),
              border: Border.all(
                color: getColor().themeColorPrimary,
                width: 1,
              )),
          child: AvatarNetworkImage(
            width: (avatarSize! - 6),
            height: (avatarSize! - 6),
            radius: (avatarSize! - 6) / 2,
            url: user.displayAvatar ?? "",
            userName: user.displayName,
            textStyle: text18.bold.textColorWhite,
          ),
        ),
        SizedBox(
          width: 10.ws,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(user.displayName, style: text14.medium.textColor141414),
            SizedBox(
              height: 2.ws,
            ),
            Text(createDate, style: text12.textColorB2B2B2)
            //Text("${readTimeStampBySecond(createDate)} trước", style: text12.textColorB2B2B2)
          ],
        ),
        const Spacer(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            TouchableOpacity(
              child: buildRowImageTextIcon(Assets.icons.icPhone.svg(), "Call", textStyle: text12.textColor141414),
              onPressed: () => _makePhoneCall("+84969735764"),
            ),
            SizedBox(width: 12.ws),
            TouchableOpacity(
              child: buildRowImageTextIcon(Assets.icons.icMessage.svg(), "Inbox", textStyle: text12.textColor141414),
              onPressed: () => _makeMessage("0969735764"),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> _makeMessage(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
      queryParameters: <String, String>{
        'body': Uri.encodeComponent('Support Rental!'),
      },
    );
    await launchUrl(launchUri);
  }
}
