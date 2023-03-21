import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '/res/style.dart';
import '/res/theme/theme_service.dart';
import '/ui/base/base_page.dart';
import '/ui/main/home/home_controller.dart';
import '/ui/main/home/item/hotel_item_view.dart';
import '/ui/widgets/button/cart_button.dart';
import '/ui/widgets/button/touchable_opacity.dart';
import '/ui/widgets/image_widget.dart';
import '/ui/widgets/line_indicator_widget.dart';
import 'item/service_hot_item_view.dart';
import 'item/service_item_view.dart';
import 'item/service_staggered_item_view.dart';

//ignore: must_be_immutable
class HomePage extends BasePage<HomeController> {
  PhotoViewComputedScale scale = PhotoViewComputedScale.covered;

  @override
  Widget buildContentView(BuildContext context, HomeController controller) {
    return Scaffold(
        backgroundColor: getColor().bgThemeColorWhite,
        body: Stack(
          children: [
            Container(
              height: 160.ws,
              decoration: BoxDecoration(
                  color: getColor().themeColor00AC44,
                  gradient: LinearGradient(begin: FractionalOffset.centerLeft, end: FractionalOffset.centerRight, colors: [
                    getColor().themeColor0060E0,
                    getColor().themeColor00B2FD,
                    getColor().themeColor00DDD4,
                  ], stops: const [
                    0.0,
                    0.4,
                    0.9
                  ])),
            ),
            _buildAppbar(),
            _buildContent(context),
          ],
        ));
  }

  Widget _buildAppbar() {
    return Container(
      height: 35.ws,
      margin: const EdgeInsets.only(top: 55),
      padding: EdgeInsets.symmetric(horizontal: 10.ws),
      child: Row(
        children: [
          Container(
            width: 95.ws,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                items: controller.cities
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: controller.selectedCity.value == item ? text14.textColorWhite : text14.textColor141414,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                value: controller.selectedCity.value,
                onChanged: (value) {
                  controller.selectedCity.value = value as String;
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
                    color: getColor().themeColorPrimary,
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
          const Spacer(),
          TouchableOpacity(
            child: Container(
              width: 220.ws,
              height: 35.ws,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.ws)),
                color: const Color(0xffffffff),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.ws),
              child: Row(
                children: [
                  Assets.images.imgSearch.image(
                    width: 15.ws,
                    height: 15.ws,
                  ),
                  SizedBox(
                    width: 5.ws,
                  ),
                  Text("Tìm theo điểm đến, hoạt động", style: text12.textColor777777, textAlign: TextAlign.left)
                ],
              ),
            ),
            onPressed: () {
              controller.onGotoSearchPage();
            },
          ),
          SizedBox(
            width: 8.ws,
          ),
          CartButton()
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 110),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)), color: getColor().themeColorWhite),
      child: ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 15.ws,
          ),
          if (controller.showUpdateAccount.value) _buildUpdateAccount(),
          if (controller.showUpdateAccount.value)
            SizedBox(
              height: 20.ws,
            ),
          _buildBanner(),
          SizedBox(
            height: 5.ws,
          ),
          Center(
            child: LineIndicatorWidget(controller.banners.length, controller.indicatorStep),
          ),
          SizedBox(
            height: 10.ws,
          ),
          _buildService(),
          _buildPromotion(),
          _buildHotelHot(),
          _buildServiceHot(),
          _buildExperienceMore(),
          _buildDiscoverMore(),
        ],
      ),
    );
  }

  Widget _buildUpdateAccount() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.ws),
      child: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(horizontal: 15.ws, vertical: 10.ws),
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8.ws)), color: getColor().themeColorFFEFE5),
        child: Row(
          children: [
            Text("Hoàn tất thông tin để đặt nhanh \nhơn và tìm các ưu đãi tốt nhất", style: text12.textColor141414, textAlign: TextAlign.left),
            SizedBox(
              width: 10.ws,
            ),
            const Spacer(),
            TouchableOpacity(
              child: Container(
                width: 74,
                height: 26,
                alignment: Alignment.center,
                decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(4)), color: Color(0xffff6f15)),
                child: Text("Cập nhật ", style: text12.bold.textColorWhite, textAlign: TextAlign.left),
              ),
              onPressed: () {},
            ),
            SizedBox(
              width: 10.ws,
            ),
            TouchableOpacity(
              child: Assets.icons.icClose1.svg(),
              onPressed: () {
                controller.showUpdateAccount.value = false;
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      height: 152.ws,
      child: PhotoViewGallery.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.banners.length,
        pageController: controller.pageController,
        backgroundDecoration: BoxDecoration(color: getColor().themeColorWhite),
        onPageChanged: (index) => controller.onChangedPage(index),
        allowImplicitScrolling: true,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions.customChild(
            minScale: scale,
            maxScale: scale * 2,
            child: Image.asset(
              controller.banners[index],
              width: double.infinity,
              height: double.infinity,
            ),
          );
        },
        loadingBuilder: (context, event) {
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  Widget _buildService() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.ws, vertical: 10.ws),
      height: 251.ws,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 1.42, crossAxisSpacing: 10, mainAxisSpacing: 10, crossAxisCount: 2),
        itemCount: controller.services.length,
        itemBuilder: (context, index) {
          return ServiceItemView(
            item: controller.services[index],
            width: 80.ws,
            height: 101.ws,
            onTap: (item) {
              controller.onGotoServices(item, context);
            },
          );
        },
      ),
    );
  }

  Widget _buildPromotion() {
    return Container(
      height: 315.ws,
      decoration: const BoxDecoration(color: Color(0xfff5f6f8)),
      padding: EdgeInsets.symmetric(horizontal: 15.ws, vertical: 25.ws),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Ưu đãi hấp dẫn", style: text18.medium.textColor141414, textAlign: TextAlign.left),
              TouchableOpacity(
                onPressed: () {
                  controller.onGotoPromotionPage();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.ws),
                  child: Text(
                    "Xem thêm",
                    style: text12.textColor777777,
                  ),
                ),
              )
            ],
          )),
          const SizedBox(
            height: 14,
          ),
          Row(
            children: [
              TouchableOpacity(
                  child: RoundNetworkImage(
                width: 165.ws,
                height: 221.ws,
                radius: 8,
                url: controller.promotions[0].image,
              )),
              SizedBox(
                width: 15.ws,
              ),
              Column(
                children: [
                  TouchableOpacity(
                      child: RoundNetworkImage(
                    width: 165.ws,
                    height: 104.ws,
                    radius: 8,
                    url: controller.promotions[1].image,
                  )),
                  SizedBox(
                    height: 13.ws,
                  ),
                  TouchableOpacity(
                      child: RoundNetworkImage(
                    width: 165.ws,
                    height: 104.ws,
                    radius: 8,
                    url: controller.promotions[2].image,
                  )),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildHotelHot() {
    return Container(
      height: 235.ws,
      decoration: BoxDecoration(color: getColor().themeColorWhite),
      padding: EdgeInsets.symmetric(horizontal: 15.ws, vertical: 25.ws),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Khách sạn hot nhất tại TPHCM", style: text18.medium.textColor141414, textAlign: TextAlign.left),
              TouchableOpacity(
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.ws),
                  child: Text(
                    "Xem thêm",
                    style: text12.textColor777777,
                  ),
                ),
              )
            ],
          )),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.hotels.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return HotelItemView(item: controller.hotels[index], width: 120.ws, height: 155.ws);
                }),
          )
        ],
      ),
    );
  }

  Widget _buildServiceHot() {
    return Container(
      height: 300.ws,
      decoration: const BoxDecoration(color: Color(0xfff5f6f8)),
      padding: EdgeInsets.symmetric(horizontal: 15.ws, vertical: 25.ws),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Các dịch vụ nổi bật", style: text18.medium.textColor141414, textAlign: TextAlign.left),
              TouchableOpacity(
                onPressed: () {
                  controller.onGotoDiscoverMorePage("Các dịch vụ nổi bật");
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.ws),
                  child: Text(
                    "Xem thêm",
                    style: text12.textColor777777,
                  ),
                ),
              )
            ],
          )),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: controller.hotServices.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return ServiceHotItemView(item: controller.hotServices[index], width: 165.ws, height: 210.ws);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 10,
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildExperienceMore() {
    return Container(
      height: 467.ws,
      decoration: BoxDecoration(color: getColor().themeColorWhite),
      padding: EdgeInsets.symmetric(horizontal: 15.ws, vertical: 25.ws),
      alignment: Alignment.topLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Trải nghiệm hấp dẫn cho mọi người", style: text18.medium.textColor141414, textAlign: TextAlign.left),
          SizedBox(
            height: 15.ws,
          ),
          RoundNetworkImage(
            width: double.infinity,
            height: 152.ws,
            url: "https://marketingai.admicro.vn/wp-content/uploads/2018/06/banner-du-lich-thai-lan-min.jpg",
            radius: 8,
          ),
          SizedBox(
            height: 15.ws,
          ),
          RoundNetworkImage(
            width: double.infinity,
            height: 152.ws,
            url: "https://webdulichmientrung.com/wp-content/uploads/2020/02/banner-huecitytour.jpg",
            radius: 8,
          ),
          SizedBox(
            height: 15.ws,
          ),
          TouchableOpacity(
            child: Container(
              width: 345.ws,
              height: 40.ws,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(6)),
                border: Border.all(color: const Color(0xff0083ed), width: 1),
                color: const Color(0xffffffff),
              ),
              child: Text("Khám phá các hoạt động mới", style: text14.medium.textColor777777, textAlign: TextAlign.center),
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Widget _buildDiscoverMore() {
    return Container(
      decoration: const BoxDecoration(color: Color(0xfff5f6f8)),
      padding: EdgeInsets.symmetric(vertical: 25.ws),
      child: Column(
        children: [
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.ws),
                child: Text("Khám phá thêm", style: text18.medium.textColor141414, textAlign: TextAlign.left),
              ),
              TouchableOpacity(
                onPressed: () {
                  controller.onGotoDiscoverMorePage("Khám phá cuối tuần");
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 15.ws),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.ws),
                    child: Text(
                      "Xem thêm",
                      style: text12.textColor777777,
                    ),
                  ),
                ),
              )
            ],
          )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.ws),
            child: MasonryGridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 10.0,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ServiceStaggeredItemView(
                    item: controller.hotServices[index],
                    width: 165.ws,
                  );
                },
                itemCount: controller.hotServices.length),
          ),
        ],
      ),
    );
  }
}
