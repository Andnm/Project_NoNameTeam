import 'package:flutter/widgets.dart';

import '/res/style.dart';
import '/ui/widgets/button/touchable_opacity.dart';

class AccountItemView extends StatelessWidget {
  final Widget icon;
  final String title;
  final VoidCallback onPressed;

  AccountItemView({required this.icon, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      child: Container(
        height: 48.ws,
        padding: EdgeInsets.symmetric(horizontal: 10.ws, vertical: 8.ws),
        child: Row(
          children: [
            icon,
            SizedBox(
              width: 10.ws,
            ),
            Text(title, style: text16.textColor141414),
            const Spacer(),
            Assets.images.imgNext.image(width: 24.ws, height: 24.ws)
          ],
        ),
      ),
      onPressed: () {
        onPressed();
      },
    );
  }
}
