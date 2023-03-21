import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/res/style.dart';
import '/res/theme/theme_service.dart';
import '/ui/widgets/image_widget.dart';
import '../../../../data/api/models/response/vehicle/hotel_item.dart';

class HotelItemView extends StatefulWidget {
  final HotelItem item;
  final double width;
  final double height;

  HotelItemView({required this.item, required this.width, required this.height});

  @override
  State<StatefulWidget> createState() => _HotelItemViewState();
}

class _HotelItemViewState extends State<HotelItemView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.ws)),
        child: Stack(
          children: [
            Container(
              width: widget.width,
              height: widget.height,
              padding: EdgeInsets.symmetric(horizontal: 5.ws, vertical: 5.ws),
              margin: EdgeInsets.only(
                top: 10.ws,
              ),
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: getColor().themeColorEBEBEC, offset: Offset(0, 5), blurRadius: 15, spreadRadius: 0)],
                  color: getColor().themeColorWhite),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RoundNetworkImage(
                    width: widget.width,
                    height: 82.ws,
                    radius: 8,
                    url: widget.item.photos![0],
                  ),
                  SizedBox(
                    height: 10.hs,
                  ),
                  Text(widget.item.name ?? "--", style: text14.bold.textColor141414, textAlign: TextAlign.left),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 5.ws),
              child: Image.asset(
                getIconRating(
                  1,
                ),
                width: 35.ws,
                height: 35.ws,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getIconRating(int rating) {
    switch (rating) {
      case 1:
        return Assets.images.imgOne.path;
      case 2:
        return Assets.images.imgTwo.path;
      default:
        return Assets.images.imgThree.path;
    }
  }
}
