import 'package:flutter/material.dart';
import 'package:rental/ui/main/booking/booking_page.dart';

import '/res/style.dart';
import '/res/theme/theme_service.dart';
import '/ui/base/base_page.dart';
import '/ui/main/account/account_page.dart';
import '/ui/main/main_controller.dart';
import '/ui/main/notification/noti_page.dart';
import '/ui/main/support/support_page.dart';
import '/ui/main/trip/trip_page.dart';
import '/ui/widgets/menu/custom_bottom_menu.dart';
import 'home/home_page.dart';

//ignore: must_be_immutable
class MainPage extends BasePage<MainController> {
  final List<Widget> pages = [HomePage(), NotificationPage(), TripPage(), BookingPage(), SupportPage(), AccountPage()];

  @override
  Widget buildContentView(BuildContext context, MainController controller) {
    final List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(
        label: LocalString.tabHome,
        icon: Assets.images.imgTabHome.image(
          width: 32.ws,
          height: 32.ws,
        ),
        activeIcon: Assets.images.imgTabHomeActive.image(
          width: 32.ws,
          height: 32.ws,
        ),
      ),
      BottomNavigationBarItem(
        label: LocalString.tabNotification,
        icon: Assets.images.imgTabDiscover.image(
          width: 32.ws,
          height: 32.ws,
        ),
        activeIcon: Assets.images.imgTabDiscoverActive.image(
          width: 32.ws,
          height: 32.ws,
        ),
      ),
      BottomNavigationBarItem(
        label: LocalString.tabTrip,
        icon: Assets.images.imgIconCard.image(
          width: 32.ws,
          height: 32.ws,
        ),
        activeIcon: Assets.images.imgTabFavoriteActive.image(
          width: 32.ws,
          height: 32.ws,
        ),
      ),
      BottomNavigationBarItem(
        label: LocalString.tabBooking,
        icon: Assets.icons.icTabOrder.svg(
          width: 32.ws,
          height: 32.ws,
        ),
        activeIcon: Assets.images.imgTabFavoriteActive.image(
          width: 32.ws,
          height: 32.ws,
        ),
      ),
      BottomNavigationBarItem(
        label: LocalString.tabSupport,
        icon: Assets.images.imgIconStar.image(
          width: 32.ws,
          height: 32.ws,
        ),
        activeIcon: Assets.images.imgTabOrderActive.image(
          width: 32.ws,
          height: 32.ws,
        ),
      ),
      BottomNavigationBarItem(
        label: LocalString.tabAccount,
        icon: Assets.images.imgTabAccount.image(
          width: 32.ws,
          height: 32.ws,
        ),
        activeIcon: Assets.images.imgTabAccountActive.image(
          width: 32.ws,
          height: 32.ws,
        ),
      ),
    ];
    return Scaffold(
      backgroundColor: getColor().bgThemeColor00DDD4,
      body: SizedBox.expand(
        child: PageView(
          controller: controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) {},
          children: pages,
        ),
      ),
      bottomNavigationBar: CustomBottomNenu(
        index: controller.pageIndex.value,
        items: items,
        onTabChanged: controller.onTabChanged,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
