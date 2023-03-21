import 'package:get/get.dart';
import 'package:rental/ui/main/trip/details/trip_detail_page.dart';

import '/ui/auth/login/login_binding.dart';
import '/ui/auth/login/login_page.dart';
/*import '/ui/cart/cart_controller.dart';
import '/ui/cart/cart_page.dart';
import '/ui/discover_more/discover_more_binding.dart';
import '/ui/discover_more/discover_more_page.dart';
import '/ui/hotel/booking/booking_controller.dart';
import '/ui/hotel/booking/booking_page.dart';
import '/ui/hotel/detail/hotel_detail_controller.dart';
import '/ui/hotel/detail/hotel_detail_page.dart';
import '/ui/hotel/detail/view_more/view_more_controller.dart';
import '/ui/hotel/detail/view_more/view_more_page.dart';
import '/ui/hotel/filter_hotel_info/filter_hotel_info_page.dart';
import '/ui/hotel/find_hotel_info/find_hotel_info_controller.dart';
import '/ui/hotel/find_hotel_result/find_hotel_result_controller.dart';
import '/ui/hotel/find_hotel_result/find_hotel_result_page.dart';
import '/ui/hotel/hotel_controller.dart';
import '/ui/hotel/hotel_page.dart';
import '/ui/hotel/hotel_utilities/hotel_utilities_controller.dart';
import '/ui/hotel/hotel_utilities/hotel_utilities_page.dart';
import '/ui/hotel/room_utilities/room_utilities_controller.dart';
import '/ui/hotel/room_utilities/room_utilities_page.dart';
import '/ui/hotel/search_place/search_place_page.dart';
import '/ui/main/discover/comment/comment_controller.dart';
import '/ui/main/discover/comment/comment_page.dart';
import '/ui/main/discover/detail/discover_detail_binding.dart';
import '/ui/main/discover/detail/discover_detail_page.dart';
import '/ui/main/discover/search/discover_search_binding.dart';
import '/ui/main/discover/search/discover_search_page.dart';
import '/ui/main/discover/topic_discover/topic_discover_controller.dart';
import '/ui/main/discover/topic_discover/topic_discover_page.dart';

import '/ui/medical/medical_binding.dart';
import '/ui/medical/medical_page.dart';
import '/ui/notification/list_notification_binding.dart';
import '/ui/notification/list_notification_page.dart';
import '/ui/places/detail/place_detail_binding.dart';
import '/ui/places/detail/place_detail_page.dart';
import '/ui/places/info_payment/info_payment_binding.dart';
import '/ui/places/info_payment/info_payment_page.dart';
import '/ui/places/option_booking/option_booking_binding.dart';
import '/ui/places/option_booking/option_booking_page.dart';
import '/ui/places/places_binding.dart';
import '/ui/places/places_page.dart';
import '/ui/promotion/list_promotion_binding.dart';
import '/ui/promotion/list_promotion_page.dart';
import '/ui/search/search_binding.dart';
import '/ui/search/search_page.dart';
import '../ui/hotel/choose_date_range/choose_date_range_controller.dart';
import '../ui/hotel/choose_date_range/choose_date_range_page.dart';
import '../ui/hotel/filter_hotel_info/filter_hotel_info_controller.dart';
import '../ui/hotel/find_room_info/find_room_info_controller.dart';
import '../ui/hotel/find_room_info/find_room_info_page.dart';
import '../ui/hotel/search_place/search_place_controller.dart';*/
import '/ui/main/main_binding.dart';
import '/ui/main/main_page.dart';
import '../ui/auth/register/register_bindding.dart';
import '../ui/auth/register/register_page.dart';
import '../ui/main/trip/details/trip_detail_binding.dart';

part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.MAIN,
      page: () => MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: AppRoutes.REGISTER,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: AppRoutes.TRIP_DETAIL,
      page: () => TripDetailPage(),
      binding: TripDetailBinding(),
    ),
    /*GetP,age(
        name: AppRoutes.UPDATE_PROFILE,
        page: () => UpdateProfilePage(),
        binding: BindingsBuilder(() {
          Get.put(UpdateProfileController());
        })),*/

    /*  GetPage(name: AppRoutes.LIST_PROMOTION, page: () => ListPromotionPage(), binding: ListPromotionBinding()),
    GetPage(name: AppRoutes.SEARCH, page: () => SearchPage(), binding: SearchBinding()),
    GetPage(name: AppRoutes.DISCOVER_MORE, page: () => DiscoverMorePage(), binding: DiscoverMoreBinding()),
    GetPage(name: AppRoutes.PLACES, page: () => PlacesPage(), binding: PlacesBinding()),
    GetPage(name: AppRoutes.OPTION_BOOKING, page: () => OptionBookingPage(), binding: OptionBookingBinding()),
    GetPage(name: AppRoutes.INFO_PAYMENT, page: () => InfoPaymentPage(), binding: InfoPaymentBinding()),
    GetPage(name: AppRoutes.DISCOVER_SEARCH, page: () => DiscoverSearchPage(), binding: DiscoverSearchBinding()),
    GetPage(name: AppRoutes.DISCOVER_DETAIL, page: () => DiscoverDetailPage(), binding: DiscoverDetailBinding()),
    GetPage(name: AppRoutes.MEDICAL, page: () => MedicalPage(), binding: MedicalBinding()),
    GetPage(name: AppRoutes.PLACE_DETAIL, page: () => PlaceDetailPage(), binding: PlaceDetailBinding()),
    GetPage(name: AppRoutes.LIST_NOTIFICATION, page: () => ListNotificationPage(), binding: ListNotificationBinding()),
    GetPage(
        name: AppRoutes.MY_CART,
        page: () => CartPage(),
        fullscreenDialog: true,
        binding: BindingsBuilder(() {
          Get.lazyPut<CartController>(() => CartController());
        })),
    GetPage(
        name: AppRoutes.POST_COMMENT,
        page: () => CommentPage(),
        fullscreenDialog: true,
        binding: BindingsBuilder(() {
          Get.put(CommentController());
        })),
    GetPage(
        name: AppRoutes.HOTEL,
        page: () => HotelPage(),
        binding: BindingsBuilder(() {
          Get.put(HotelController());
          Get.put(FindHotelInfoController());
        })),
    GetPage(
        name: AppRoutes.TOPIC_DISCOVER,
        page: () => TopicDiscoverPage(),
        binding: BindingsBuilder(() {
          Get.put(TopicDiscoverController());
        })),
    GetPage(
        name: AppRoutes.HOTEL_DETAIL,
        page: () => HotelDetailPage(),
        binding: BindingsBuilder(() {
          Get.put(HotelDetailController());
        })),
    GetPage(
        name: AppRoutes.SEARCH_PLACE,
        page: () => SearchPlacePage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<SearchPlaceController>(() => SearchPlaceController());
        })),
    GetPage(
        name: AppRoutes.CHOOSE_DATE_RANGE,
        page: () => ChooseDateRangePage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<ChooseDateRangeController>(() => ChooseDateRangeController());
        })),
    GetPage(
        name: AppRoutes.HOTEL_UTILITIES,
        page: () => HotelUtilitiesPage(),
        fullscreenDialog: true,
        binding: BindingsBuilder(() {
          Get.put(HotelUtilitiesController());
        })),
    GetPage(
        name: AppRoutes.ROOM_UTILITIES,
        page: () => RoomUtilitiesPage(),
        fullscreenDialog: true,
        binding: BindingsBuilder(() {
          Get.put(RoomUtilitiesController());
        })),
    GetPage(
        name: AppRoutes.FIND_ROOM_INFO,
        page: () => FindRoomInfoPage(),
        fullscreenDialog: true,
        binding: BindingsBuilder(() {
          Get.lazyPut<FindRoomInfoController>(() => FindRoomInfoController(), fenix: true);
        })),
    GetPage(
        name: AppRoutes.BOOKING,
        page: () => BookingPage(),
        binding: BindingsBuilder(() {
          Get.put(BookingController());
        })),
    GetPage(
        name: AppRoutes.FIND_ROOM_RESULT,
        page: () => FindHotelResultPage(),
        binding: BindingsBuilder(() {
          Get.put(FindHotelResultController());
        })),
    GetPage(
        name: AppRoutes.FILTER_HOTEL_INFO,
        page: () => FilterHotelInfoPage(),
        binding: BindingsBuilder(() {
          Get.put(FilterHotelInfoController());
        })),
    GetPage(
        name: AppRoutes.HOTEL_VIEW_MORE,
        page: () => ViewMorePage(),
        binding: BindingsBuilder(() {
          Get.put(ViewMoreController());
        })),*/
  ];
}
