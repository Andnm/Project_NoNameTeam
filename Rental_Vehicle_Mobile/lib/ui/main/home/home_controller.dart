import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '/app/app_pages.dart';
import '/data/api/api_constants.dart';
import '/data/api/models/promotion_item.dart';
import '/data/api/models/service_hot_item.dart';
import '/data/api/models/service_item.dart';
import '/data/storage/data_constant.dart';
import '/res/style.dart';
import '/res/theme/theme_service.dart';
import '/ui/base/base_controller.dart';
import '../../../data/api/models/response/vehicle/hotel_item.dart';

class HomeController extends BaseController {
  late ScrollController scrollController = ScrollController();
  RxBool isShowButton = false.obs;
  RxInt pageValue = 0.obs;
  RxInt indicatorStep = 0.obs;
  late PageController pageController;
  RxList<String> banners = [Assets.images.imgBanner.path, Assets.images.imgBanner.path, Assets.images.imgBanner.path].obs;
  RxList<ServiceItem> services = SERVICES.obs;
  late RxList<HotelItem> hotels;
  late RxList<HotServiceItem> hotServices;
  List<String> cities = ["Hà Nội", "Đà Nẵng", "TP.HCM"];
  late RxList<PromotionItem> promotions;
  late RxString selectedCity;
  RxBool showUpdateAccount = true.obs;

  @override
  bool get isShowScreenError => false;

  @override
  void onClose() {
    scrollController.dispose();
    pageController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: pageValue.value);
    scrollController.addListener(() {
      if (scrollController.offset > ((scrollController.position.maxScrollExtent / 3) * 2)) {
        isShowButton.value = true;
      } else
        isShowButton.value = false;
    });
    hotels = getHotels().obs;
    hotServices = getHotServices().obs;
    promotions = getPromotions().obs;
    selectedCity = cities[2].obs;
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    scrollController.removeListener(() {});
  }

  onChangedPage(int page) {
    pageValue.value = page;
    indicatorStep.value = page;
  }

  onGotoPromotionPage() {
    Get.toNamed(AppRoutes.LIST_PROMOTION, arguments: ["Ưu đãi hấp dẫn"]);
  }

  onGotoSearchPage() {
    Get.toNamed(AppRoutes.SEARCH);
  }

  onGotoDiscoverMorePage(String title) {
    Get.toNamed(AppRoutes.DISCOVER_MORE, arguments: [title]);
  }

  onGotoCartPage() {
    Get.toNamed(AppRoutes.OPTION_BOOKING);
  }

  void onGotoBSGD() async {
    Get.toNamed(AppRoutes.MEDICAL, arguments: [URL_TTGD]);
  }

  onGotoServices(ServiceItem item, BuildContext context) {
    if (item.type == SERVICES[0].type) {
      Get.toNamed(AppRoutes.HOTEL);
    } else if (item.type == SERVICES[2].type) {
      Get.toNamed(AppRoutes.PLACES);
    } else if (item.type == SERVICES[4].type) {
      Get.toNamed(AppRoutes.MEDICAL, arguments: [URL_TTGD]);
    } else {
      Get.snackbar("Thông báo", "Tính năng đang được đấu nối", colorText: getColor().textColorWhite, backgroundColor: getColor().themeColorFF6F15);
    }
  }

  List<PromotionItem> getPromotions() {
    return [
      PromotionItem(
          name: "Siêu sale mừng đại lễ: Ưu đãi chào Đà Nẵng",
          image: "https://satra.com.vn/upload/large/Thumb/khuyen-mai-30-4-2020.jpg",
          time: "Từ 12/07 - 30/07"),
      PromotionItem(
          name: "Siêu khuyến mãi hè 2022",
          image: "https://media.vietravel.com/images/news/CTKM_KV%20Soi%20domg%20An%20toan%20-%20Copy.jpg",
          time: "Từ 15/07 - 30/07"),
      PromotionItem(
          name: "Khuyến mãi tua học sinh/sinh viên",
          image: "https://images.vietnamtourism.gov.vn/vn/images/2019/CNMN/26.11.White_Thursday1.jpg",
          time: "Từ 12/07 - 30/07"),
      PromotionItem(
          name: "Siêu sale mừng đại lễ: Ưu đãi chào Đà Nẵng",
          image: "https://nucuoimekong.com/wp-content/uploads/du-lich-an-toan-mua-covid.jpg",
          time: "Từ 12/07 - 30/07"),
      PromotionItem(
          name: "Siêu sale mừng đại lễ: Ưu đãi chào Đà Nẵng",
          image: "https://tourdanangcity.vn/wp-content/uploads/2020/05/baner-ba-na-hills1-cau-vang.jpg?v=1615421387",
          time: "Từ 12/07 - 30/07"),
      PromotionItem(
          name: "Siêu sale mừng đại lễ: Ưu đãi chào Đà Nẵng",
          image: "https://letsflytravel.vn/assets/source/combo/combo-ks-4n3d.jpg",
          time: "Từ 12/07 - 30/07"),
      PromotionItem(
          name: "Siêu sale mừng đại lễ: Ưu đãi chào Đà Nẵng",
          image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5vsgdQH8bqVN0qD6SWpdf5j7xcVRJKJI5ag&usqp=CAU",
          time: "Từ 12/07 - 30/07"),
      PromotionItem(
          name: "Siêu sale mừng đại lễ: Ưu đãi chào Đà Nẵng",
          image: "https://satra.com.vn/upload/large/Thumb/khuyen-mai-30-4-2020.jpg",
          time: "Từ 12/07 - 30/07"),
    ];
  }

  List<HotelItem> getHotels() {
    return [
      HotelItem(
        name: "Intercontinental Danang",
        photos: ["https://theculturetrip.com/wp-content/uploads/2017/02/img_5279.jpg"],
      ),
      HotelItem(
        name: "Olalani Resort & Condotel",
        photos: ["https://pix10.agoda.net/hotelImages/6882032/-1/3fc1a0770a8cc3e24c9dad6ac975b4c5.jpg?ca=9&ce=1&s=1024x768"],
      ),
      HotelItem(
        name: "One Opera DaNang Hotel",
        photos: ["https://destination-review.com/wp-content/uploads/2021/04/10-best-hcmc-romantic-hotels.jpg"],
      ),
      HotelItem(
        name: "See allLa Vela Saigon Hotel",
        photos: ["https://pix8.agoda.net/hotelImages/13571664/-1/a2605513eefa00554935c347d4b9de0d.jpg?ca=10&ce=1&s=450x450"],
      ),
      HotelItem(
        name: "The Chill Suites- City Center",
        photos: ["https://pix8.agoda.net/hotelImages/7295630/-1/cc29ff8b9c5ab4e1a8009cae17f4e8ec.jpg?ca=13&ce=1&s=1024x"],
      ),
      HotelItem(
        name: "Pullman Saigon",
        photos: ["https://static.tripzilla.com/thumb/a/1/135841_800x.jpg"],
      )
    ];
  }

  List<HotServiceItem> getHotServices() {
    return [
      HotServiceItem(
          name: "Tour Bà Nà hills 1 ngày từ Đà Nẵng đi chơi thả ga với giá rất rẻ",
          image: "https://danatravel.vn/data/tour/900/ba-na-1560224326.jpg",
          price: "Từ 668,000 đ",
          address: "Đà Nẵng"),
      HotServiceItem(
          name: "Vé vui chơi công viên châu á",
          image: "https://thanhtra.com.vn/portals/0/news_images/2020/03/congdinh/sun_world_danang_wonders_2.jpg",
          price: "Từ 368,000 đ",
          address: "Đà Nẵng"),
      HotServiceItem(
          name: "Đi Hội An 1 ngày đêm",
          image: "https://www.vietnambooking.com/wp-content/uploads/2019/10/ve-may-bay-ha-noi-di-hoi-an-15102019-2.png",
          price: "Từ 568,000 đ",
          address: "Đà Nẵng"),
      HotServiceItem(
          name: "Tour đi bán đảo Sơn Trà đi tham quan chùa,tắm biển",
          image: "https://statics.vinpearl.com/du-lich-ban-dao-Son-Tra-hinh-anh3%20(1).jpg",
          price: "Từ 268,000 đ",
          address: "Đà Nẵng"),
      HotServiceItem(
          name: "Tham quan Ngũ Hành Sơn",
          image: "https://res.klook.com/image/upload/fl_lossy.progressive,q_85/c_fill,w_680/v1606972484/blog/e6w4rvhigbw1akc7q1wd.webp",
          price: "Từ 868,000 đ",
          address: "Đà Nẵng")
    ];
  }
}
