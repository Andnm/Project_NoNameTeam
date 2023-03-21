import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:rental/res/style.dart';
import 'package:rental/ui/widgets/button/touchable_opacity.dart';

import '../../../../res/theme/theme_service.dart';
import '../../../../utils/data_util.dart';
import '../../../base/base_page.dart';
import '../../../widgets/button/custom_border_button.dart';
import '../../../widgets/button/custom_button.dart';
import '../../../widgets/button/touchable_circle_opacity.dart';
import '../../../widgets/dotted_border_widget.dart';
import '../../../widgets/image_widget.dart';
import '../../../widgets/rating_chart_widget.dart';
import 'trip_detail_controller.dart';

//ignore: must_be_immutable
class TripDetailPage extends BasePage<TripDetailController> {
  @override
  Widget buildContentView(BuildContext context, TripDetailController controller) {
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
            backgroundColor: getColor().themeColorWhite,
            leading: TouchableCircleOpacity(
              icon: Assets.images.imgBack.image(
                width: 24.ws,
                height: 24.ws,
                fit: BoxFit.fill,
                color: getColor().themeColorWhite,
              ),
              size: 36.ws,
              onPressed: () {
                Get.back();
              },
            ),
            actions: [
              TouchableCircleOpacity(
                icon: Assets.images.imgIconMess.image(
                  width: 24.ws,
                  height: 24.ws,
                  fit: BoxFit.fill,
                  color: getColor().themeColorWhite,
                ),
                size: 36.ws,
                onPressed: () {},
              ),
              TouchableCircleOpacity(
                icon: Assets.images.imgLike2.image(
                  width: 24.ws,
                  height: 24.ws,
                  fit: BoxFit.fill,
                  color: getColor().themeColorWhite,
                ),
                size: 36.ws,
                onPressed: () {},
              ),
              TouchableCircleOpacity(
                icon: Assets.images.imgIconShare.image(
                  width: 24.ws,
                  height: 24.ws,
                  fit: BoxFit.fill,
                  color: getColor().themeColorWhite,
                ),
                size: 36.ws,
                onPressed: () {},
              ),
              TouchableCircleOpacity(
                icon: Assets.icons.icCart.svg(
                  width: 32.ws,
                  height: 32.ws,
                  fit: BoxFit.fill,
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
                      height: 150.ws,
                      radius: 8,
                      url: controller.detailArgument.image,
                    ),
                  ),
                  Positioned(
                    bottom: -5,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 16.ws,
                      decoration: BoxDecoration(
                        color: getColor().themeColorWhite,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(15),
                        ),
                      ),
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
                    return _buildDetailInfoView();
                  case 1:
                    return _buildServicePackView();
                  case 2:
                    return _buildHighlightAndRatingView();
                  case 3:
                    return _buildServiceInfoView();
                  default:
                    return Container();
                }
              }, //ListTile
              childCount: 2,
            ), //SliverChildBuildDelegate
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.ws, vertical: 16.ws),
        height: 116.ws,
        width: double.infinity,
        color: getColor().themeColorWhite,
        child: Column(
          children: [
            StreamBuilder<dynamic>(
                stream: controller.listenerTotalPrice.stream,
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return Row(
                    children: [
                      Text("Tổng tiền:", style: text16.textColor141414, textAlign: TextAlign.left),
                      const SizedBox(width: 10),
                      Text(formatCurrency(controller.detailArgument.price), style: text16.medium.textColor141414, textAlign: TextAlign.left),
                      Text("x ${controller.dayCount}", style: text16.medium.textColor141414, textAlign: TextAlign.left),
                      Text("= ${snapshot.data != null && snapshot.data > 0 ? formatCurrency(snapshot.data) : "0đ"}",
                          style: text16.medium.textColor141414, textAlign: TextAlign.left)
                    ],
                  );
                }),
            SizedBox(
              height: 11.ws,
            ),
            CustomButton(
              text: "Đặt ngay",
              radius: 5.ws,
              width: 165.ws,
              height: 40.ws,
              isEnable: true,
              background: getColor().themeColorPrimary,
              textStyle: text16.medium.textColorWhite,
              onPressed: controller.bookingVehicle,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDetailInfoView() {
    final item = controller.vehicleItem;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.ws, vertical: 12.ws),
      child: Column(children: [
        Text(item.model ?? "", style: text28.bold.textColorPrimary, textAlign: TextAlign.left),
        const SizedBox(height: 10),
        Text(item.licensePlate ?? "", style: text24.bold.textColorPrimary, textAlign: TextAlign.left),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Assets.images.imgIconStar.image(
              width: 24.ws,
              height: 24.ws,
            ),
            SizedBox(
              width: 4.ws,
            ),
            Text("5,0", style: text14.textColorFF6F15, textAlign: TextAlign.left),
            SizedBox(
              width: 8.ws,
            ),
            Text("( 14 đánh giá)", style: text14.textColor777777, textAlign: TextAlign.left),
            SizedBox(
              width: 8.ws,
            ),
            Text("•   86 người đã mua", style: text14.textColor141414, textAlign: TextAlign.left)
          ],
        ),
        SizedBox(height: 12.ws),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DottedBorderWidget(
              width: 106.ws,
              height: 49.ws,
              radius: 8.ws,
              text: item.transmission ?? "",
              lineColor: getColor().themeColorD3D3D4,
              icon: Assets.icons.icCar.svg(
                width: 14.ws,
                height: 14.ws,
              ),
              textStyle: text12.textColor141414,
            ),
            DottedBorderWidget(
              width: 106.ws,
              height: 49.ws,
              radius: 8.ws,
              text: item.fuelType ?? "",
              lineColor: getColor().themeColorD3D3D4,
              icon: Assets.icons.icPistons.svg(
                width: 14.ws,
                height: 14.ws,
              ),
              textStyle: text12.textColor141414,
            ),
            DottedBorderWidget(
              width: 106.ws,
              height: 49.ws,
              radius: 8.ws,
              text: controller.detailArgument.isRented == true ? "Rentable" : "Unrentable",
              lineColor: getColor().themeColorD3D3D4,
              icon: Assets.icons.icPistons.svg(
                width: 14.ws,
                height: 14.ws,
              ),
              textStyle: text12.textColor141414,
            ),
          ],
        ),
        SizedBox(height: 12.ws),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DottedBorderWidget(
              width: 106.ws,
              height: 49.ws,
              radius: 8.ws,
              text: "Unlocation",
              lineColor: getColor().themeColorD3D3D4,
              icon: Assets.images.imgIconLocation.image(
                width: 14.ws,
                height: 14.ws,
                color: Colors.black,
              ),
              textStyle: text12.textColor141414,
            ),
            DottedBorderWidget(
              width: 106.ws,
              height: 49.ws,
              radius: 8.ws,
              text: item.vehicleType ?? "",
              lineColor: getColor().themeColorD3D3D4,
              icon: Assets.images.imgIconCard.image(
                width: 14.ws,
                color: Colors.black,
                height: 14.ws,
              ),
              textStyle: text12.textColor141414,
            ),
            DottedBorderWidget(
              width: 106.ws,
              height: 49.ws,
              radius: 8.ws,
              text: item.yearOfManufacturer ?? "",
              lineColor: getColor().themeColorD3D3D4,
              icon: Assets.icons.icCalender.svg(
                width: 14.ws,
                height: 14.ws,
                color: Colors.black,
              ),
              textStyle: text12.textColor141414,
            ),
          ],
        ),
        const SizedBox(height: 10),
      ]),
    );
  }

  Widget _buildServicePackView() {
    var price = controller.detailArgument.price;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.ws, vertical: 25.ws),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Gói dịch vụ", style: text20.bold.textColor141414, textAlign: TextAlign.left),
          SizedBox(width: double.infinity, child: Text(formatCurrency(price), style: text34.bold.textColorPrimary, textAlign: TextAlign.center)),
          Text("Start booking date:", style: text16.bold.textColor141414, textAlign: TextAlign.left),
          const SizedBox(height: 4),
          TouchableOpacity(
            onPressed: controller.bookingDateStart,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: color141414),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Assets.images.imgIconCalenderBlack.image(width: 20.ws, height: 20.ws),
                  StreamBuilder<dynamic>(
                    stream: controller.listenerBookingStart.stream,
                    builder: (context, snapshot) {
                      return Text(snapshot.data.toString(), style: text16.bold.textColor141414, textAlign: TextAlign.left);
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text("End booking date:", style: text16.bold.textColor141414, textAlign: TextAlign.left),
          const SizedBox(height: 4),
          TouchableOpacity(
            onPressed: controller.bookingDateEnd,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: color141414),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Assets.images.imgIconCalenderBlack.image(width: 20.ws, height: 20.ws),
                  StreamBuilder<dynamic>(
                    stream: controller.listenerBookingEnd.stream,
                    builder: (context, snapshot) {
                      return Text(snapshot.data.toString(), style: text16.bold.textColor141414, textAlign: TextAlign.left);
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHighlightAndRatingView() {
    return Container(
      color: getColor().themeColorWhite,
      padding: EdgeInsets.symmetric(horizontal: 15.ws),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30.ws,
          ),
          Text("Điểm nổi bật", style: text20.bold.textColor141414, textAlign: TextAlign.left),
          SizedBox(
            height: 16.ws,
          ),
          Text(
              "•   Khám phá phố cổ Hội An - một trong những thương cảng sầm uất của Việt Nam vào thế kỷ thứ 16 với những nét kiến trúc được pha trộn giữa Việt Nam và các nước Trung Quốc, Nhật Bản,…\n•   Tham quan các bảo tàng văn hoá, các hội quán và các đình, đền tại Hội An - những điểm đến mang đậm giá trị văn hoá, lịch sử một thời vàng son của dân tộc\n•   Đến làng gốm Thanh Hà - nơi có truyền thống làm gốm hơn 500 năm, tìm hiểu về quy trình làm gốm thủ công và trổ tài làm gốm\n•   Tận hưởng không gian xanh tươi tại làng rau Trà Quế, trải nghiệm 1 ngày làm nông dân, học cách trồng rau và thu hoạch rau tươi cộp mác “Trà Quế Hội An”",
              style: text14.textColor141414,
              textAlign: TextAlign.left),
          SizedBox(
            height: 30.hs,
          ),
          Text("Đánh giá gần đây", style: text20.bold.textColor141414, textAlign: TextAlign.left),
          SizedBox(
            height: 14.hs,
          ),
          RatingChartWidget(
            chartWidth: 180.ws,
          ),
          SizedBox(
            height: 16.hs,
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(28.ws)),
                    border: Border.all(
                      color: const Color(0xfff5f6f8),
                      width: 1,
                    )),
                child: CircleNetworkImage(
                  size: 36.ws,
                  url: "https://toanthaydinh.com/wp-content/uploads/2020/04/avatar-girl-xinh-10.jpg",
                ),
              ),
              SizedBox(
                width: 8.ws,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nguyễn Ngọc Minh Hằng", style: text14.medium.textColor141414, textAlign: TextAlign.left),
                  SizedBox(
                    height: 3.ws,
                  ),
                  Text("07:55 22/5/2022", style: text12.textColor777777, textAlign: TextAlign.left)
                ],
              ),
              const Spacer(),
              RatingBarIndicator(
                rating: 4.2,
                itemCount: 5,
                itemSize: 18.0,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, _) => Assets.images.imgIconStar.image(
                  width: 18.ws,
                  height: 18.ws,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8.hs,
          ),
          Text("Đánh giá cho: Vé vào cổng điểm tham quan: Làng gốm Thanh Hà", style: text14.textColor929394, textAlign: TextAlign.left),
          const SizedBox(
            height: 10,
          ),
          Text("Mình mua vé trên Sàn du lịch và đổi ngay tại quầy vé làng gốm. Chỉ cần xuất voucher và nhận vé ngay tại cổng, rất nhanh và tiện lợi.",
              style: text16.textColor141414, textAlign: TextAlign.left),
          const SizedBox(
            height: 20,
          ),
          CustomBorderButton(
            text: "Xem tất cả đánh giá",
            borderColor: getColor().themeColorPrimary,
            radius: 5.ws,
            width: 345.ws,
            height: 40.ws,
            isEnable: true,
            textStyle: text14.medium.textColorPrimary,
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Widget _buildServiceInfoView() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.ws, vertical: 15.ws),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.ws,
          ),
          Text("Về dịch vụ này", style: text20.bold.textColor141414, textAlign: TextAlign.left),
          SizedBox(
            height: 10.ws,
          ),
          SizedBox(
            height: 16.ws,
          ),
          RoundNetworkImage(
            width: double.infinity,
            height: 200.ws,
            radius: 9.ws,
            url: "https://vcdn-vnexpress.vnecdn.net/2017/09/01/hoi-an-7738-1504258620.jpg",
          ),
          SizedBox(
            height: 16.ws,
          ),
          Text(
            "Bên cạnh khu vực phố cổ Hội An, đến với thành phố Hội An, bạn còn có cơ hội tham qua những làng nghề văn hoá truyền thống, nổi bật trong đó là làng gốm Thanh Hà, được hình thành từ thế kỷ thứ 16, ngày nay trở thành một trong những “bảo tàng sống”, là nơi cung cấp nguồn tư liệu quý giá cho các nhà khoa học nghiên cứu. Đến với làng gốm Thanh Hà, bạn sẽ có cơ hội tìm hiểu về quy trình làm ra những sản phẩm gốm bằng kỹ thuật cổ truyền, và tự tay làm ra cho mình những món đồ gốm dưới sự chỉ dẫn của các nghệ nhân",
            style: text16.textColor141414,
          ),
          SizedBox(
            height: 16.ws,
          ),
        ],
      ),
    );
  }
}
