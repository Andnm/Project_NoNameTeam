class HotServiceItem {
  final String name;
  final String image;
  final String price;
  final String address;
  final bool? isFavorite;

  HotServiceItem({required this.name, required this.image, required this.price, required this.address, this.isFavorite = false});
}
