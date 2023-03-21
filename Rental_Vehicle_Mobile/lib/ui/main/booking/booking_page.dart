import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental/res/theme/theme_service.dart';
import 'package:rental/ui/widgets/button/touchable_opacity.dart';

import '/ui/base/base_page.dart';
import '../../../app/app_pages.dart';
import '../../../data/storage/data_constant.dart';
import '../../../res/style.dart';
import '../../../utils/data_util.dart';
import '../../../utils/date_time_utils.dart';
import 'booking_controller.dart';

//ignore: must_be_immutable
class BookingPage extends BasePage<BookingController> {
  @override
  Widget buildContentView(BuildContext context, BookingController controller) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getColor().primary,
        title: Text("Booking History", style: text34.textColorWhite),
        actions: [
          SizedBox(
            width: 95.ws,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                items: controller.filter
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: controller.selectedFilter.value == item ? text14.textColorF20606 : text14.textColor141414,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                value: controller.selectedFilter.value,
                onChanged: (value) {
                  controller.syncFilter(value as String);
                },
                iconStyleData: IconStyleData(
                  icon: Assets.images.imgArrow.image(
                    width: 32.ws,
                    height: 32.ws,
                  ),
                  iconSize: 14,
                ),
                buttonStyleData: const ButtonStyleData(
                  height: 50,
                  width: 100,
                  padding: EdgeInsets.only(left: 5, right: 5),
                  elevation: 2,
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.only(left: 10, right: 10),
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 200,
                  width: 160,
                  padding: null,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: getColor().textColorWhite,
                  ),
                  elevation: 8,
                  offset: const Offset(-20, 0),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(20),
                    thickness: MaterialStateProperty.all<double>(6),
                    thumbVisibility: MaterialStateProperty.all<bool>(true),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: buildListBooking(),
      ),
    );
  }

  Widget buildListBooking() => controller.listBooking.isNotEmpty
      ? ListView.builder(
          shrinkWrap: true,
          itemCount: controller.listBooking.length,
          itemBuilder: (BuildContext ctx, index) {
            final item = controller.listBooking[index];
            return TouchableOpacity(
              onPressed: () {
                Get.toNamed(AppRoutes.TRIP_DETAIL, arguments: item);
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: getColor().themeColorEBEBEC,
                      offset: const Offset(0, 5),
                      blurRadius: 10,
                      spreadRadius: 0,
                    )
                  ],
                  color: getColor().themeColorWhite,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(item.licensePlate ?? '', style: text16.bold.textColor141414),
                    const SizedBox(height: 4),
                    Text(formatDate(item.bookingStart) ?? '', style: text16.bold.textColor141414),
                    const SizedBox(height: 4),
                    Text(formatDate(item.bookingEnd) ?? '', style: text16.bold.textColor141414),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Name: ${item.userId?.displayName ?? ""}", style: text14.bold.textColor141414),
                        Text("Email: ${item.userId?.email ?? ""}", style: text14.bold.textColor141414),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(formatCurrency(item.totalPrice ?? 0), style: text14.bold.textColor141414),
                        Text("Has Driver: ${item.hasDriver}", style: text14.bold.textColor141414),
                        Row(
                          children: [
                            Container(
                              width: 12.ws,
                              height: 12.ws,
                              decoration: BoxDecoration(shape: BoxShape.circle, color: (item.bookingStatus == STATUS_COMPLETE) ? color00AC44 : colorF20606),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              item.bookingStatus ?? "",
                              style: text12.copyWith(color: item.bookingStatus == STATUS_COMPLETE ? color00AC44 : colorF20606),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            );
          },
        )
      : const SizedBox.shrink();
}
