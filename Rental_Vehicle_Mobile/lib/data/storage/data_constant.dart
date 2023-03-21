import 'package:get/get.dart';

import '/data/api/models/base_data.dart';
import '/data/api/models/service_item.dart';
import '/data/storage/models/payment_item.dart';
import '../../res/style.dart';

const ROLE_CUSTOMER = "Customer";
const ROLE_ADMIN = "Admin";
const ROLE_M = "OTHER";
const STATUS_COMPLETE = "Completed";

const IMAGE_DEMO = "https://rental-vehicle-application.cyclic.app/static/media/blog-2.dce2eeb8549652564638.jpg";

final SERVICES = [
  ServiceItem(type: 8, keyName: 'Tìm \nkhách sạn', icon: Assets.images.imgService10.path, style: text12.textColor141414),
  ServiceItem(type: 2, keyName: 'Ưu đãi \nkhách sạn', icon: Assets.images.imgService7.path, style: text12.textColor141414),
  ServiceItem(type: 9, keyName: 'Địa điểm \ntham quan', icon: Assets.images.imgService5.path, style: text12.textColor141414),
  ServiceItem(type: 3, keyName: 'Thủ tục xuất \nnhập cảnh', icon: Assets.images.imgService2.path, style: text12.textColor141414),
  ServiceItem(type: 5, keyName: 'Nhà thuốc,\nBệnh viện', icon: Assets.images.imgService3.path, style: text12.textColor141414),
  ServiceItem(type: 4, keyName: 'Ẩm thực & \nnhà hàng', icon: Assets.images.imgService8.path, style: text12.textColor141414),
  ServiceItem(type: 1, keyName: 'Hộ chiếu \nvaccine', icon: Assets.images.imgService1.path, style: text12.textColor141414),
  ServiceItem(type: 6, keyName: 'Thuê xe \nriêng', icon: Assets.images.imgService9.path, style: text12.textColor141414),
  ServiceItem(type: 7, keyName: 'Gói 4G/5G', icon: Assets.images.imgService4.path, style: text12.textColor141414),
  ServiceItem(type: 10, keyName: 'Tour & \nngắm cảnh', icon: Assets.images.imgService6.path, style: text12.textColor141414),
  ServiceItem(type: 11, keyName: 'Đưa đón sân bay', icon: Assets.images.imgService11.path, style: text12.textColor141414),
];
final SERVICES_CHILD = [
  ServiceItem(type: 1, keyName: 'Công viên & \nKhu vui chơi', icon: Assets.images.imgServiceChild1.path, style: text12.textColor141414),
  ServiceItem(type: 2, keyName: 'Thiên nhiên & \nvườn bách thảo', icon: Assets.images.imgServiceChild2.path, style: text12.textColor141414),
  ServiceItem(type: 3, keyName: 'Bảo tàng & \ntriển lãm', icon: Assets.images.imgServiceChild3.path, style: text12.textColor141414),
  ServiceItem(type: 4, keyName: 'Thủy cung,\nvườn thú', icon: Assets.images.imgServiceChild4.path, style: text12.textColor141414),
  ServiceItem(type: 6, keyName: 'Cáp treo &\nngắm cảnh', icon: Assets.images.imgServiceChild5.path, style: text12.textColor141414),
  ServiceItem(type: 6, keyName: 'Show diễn\n thông thường', icon: Assets.images.imgServiceChild6.path, style: text12.textColor141414),
  ServiceItem(type: 7, keyName: 'Di tích lịch sử', icon: Assets.images.imgServiceChild7.path, style: text12.textColor141414),
  ServiceItem(type: 8, keyName: 'Khác', icon: Assets.images.imgServiceChild8.path, style: text12.textColor141414),
];
final ORDER_STATUS = [
  BaseData(id: "615abd0d43845a1bac00ad31", name: 'Chờ thanh toán'),
  BaseData(id: "615abd0d43845a1bac00ad32", name: 'Đã thanh toán'),
  BaseData(id: "615ac65c43845a1bac00ad34", name: 'Đã hủy'),
];

final PAYMENT_METHOD = [
  PaymentItem(name: "Thanh toán bằng ví MOMO", icons: [Assets.images.imgIconMomo.path], isSelected: true.obs),
  PaymentItem(name: "Thanh toán bằng ZaloPay", icons: [Assets.images.imgIconZaloPay.path], isSelected: false.obs),
  PaymentItem(name: "Thanh toán bằng VNPay", icons: [Assets.images.imgIconVnpay.path], isSelected: false.obs),
  PaymentItem(name: "Thanh toán bằng thẻ tín dụng", icons: [], isSelected: false.obs)
];
final CITY = [
  BaseData(id: "615abd0d43845a1bac00ad31", name: 'Hà Nội'),
  BaseData(id: "615abd0d43845a1bac00ad32", name: 'Đà Nẵng'),
  BaseData(id: "615ac65c43845a1bac00ad34", name: 'TP.HCM'),
];
