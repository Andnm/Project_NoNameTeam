import '/data/api/models/base_data.dart';

class OrderItem {
  final String url;
  final String name;
  final String address;
  final String price;
  final BaseData status;

  OrderItem({required this.url, required this.name, required this.address, required this.price, required this.status});
}
