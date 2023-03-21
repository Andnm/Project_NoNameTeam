import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental/res/theme/theme_service.dart';
import 'package:rental/ui/widgets/button/touchable_opacity.dart';

import '/ui/base/base_page.dart';
import '../../../app/app_pages.dart';
import '../../../res/style.dart';
import '../../../utils/data_util.dart';
import '../../widgets/icon/icons_component.dart';
import '../../widgets/image_widget.dart';
import 'trip_controller.dart';

//ignore: must_be_immutable
class TripPage extends BasePage<TripController> {
  @override
  Widget buildContentView(BuildContext context, TripController controller) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getColor().primary,
        title: Text("Thuê xe", style: text34.textColorWhite),
      ),
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: buildListVehicle(),
      ),
    );
  }

  Widget buildListVehicle() => controller.listVehicle.isNotEmpty
      ? ListView.builder(
          shrinkWrap: true,
          itemCount: controller.listVehicle.length,
          itemBuilder: (BuildContext ctx, index) {
            final item = controller.listVehicle[index];
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
                    RoundNetworkImage(
                      width: double.infinity,
                      height: 150.ws,
                      radius: 8,
                      url: item.image,
                    ),
                    const SizedBox(height: 10),
                    Text(item.licensePlate ?? '', style: text16.bold.textColor141414),
                    const SizedBox(height: 4),
                    Text(formatCurrency(item.price), style: text14.bold.textColor141414),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildRowImageTextIcon(
                            item.description?.contains("Car") == true
                                ? Assets.icons.icCar.svg(color: colorFF6F15, width: 20.ws)
                                : Assets.icons.icMotor.svg(color: colorFF6F15, width: 20.ws),
                            item.description ?? "",
                            textStyle: text12.textColor141414),
                        buildRowImageTextIcon(Assets.icons.icEnginMotor.svg(color: colorFF6F15, width: 20.ws), "${item.insurance ?? ""} Insurance",
                            textStyle: text12.textColor141414),
                        buildRowImageTextIcon(Assets.icons.icPistons.svg(color: colorFF6F15, width: 20.ws), item.isRented == true ? "Rentable" : "Unrentable",
                            textStyle: text12.textColor141414),
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
