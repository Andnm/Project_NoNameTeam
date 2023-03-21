import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/app_pages.dart';
import '/data/api/models/service_hot_item.dart';
import '/res/style.dart';
import '/res/theme/theme_service.dart';
import '/ui/widgets/image_widget.dart';

class ServiceHotItemView extends StatefulWidget {
  final HotServiceItem item;
  final double width;
  final double height;

  ServiceHotItemView({
    required this.item,
    required this.width,
    required this.height,
  });

  @override
  State<StatefulWidget> createState() => _ServiceHotItemViewState();
}

class _ServiceHotItemViewState extends State<ServiceHotItemView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.PLACE_DETAIL);
      },
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8.ws)),
            child: Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: getColor().themeColorEBEBEC, offset: Offset(0, 5), blurRadius: 15, spreadRadius: 0)],
                  color: getColor().themeColorWhite),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RoundNetworkImageTopRadius(
                    width: widget.width,
                    height: 100.ws,
                    radius: 8,
                    url: widget.item.image,
                  ),
                  SizedBox(
                    height: 10.ws,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 13.ws),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.item.address, style: text12.textColor777777, textAlign: TextAlign.left),
                        SizedBox(
                          height: 4.hs,
                        ),
                        Text(widget.item.name, maxLines: 2, overflow: TextOverflow.ellipsis, style: text16.bold.textColor141414, textAlign: TextAlign.left),
                        SizedBox(
                          height: 8.ws,
                        ),
                        Row(
                          children: [
                            Text("từ", style: text12.textColor777777, textAlign: TextAlign.left),
                            SizedBox(
                              width: 4.ws,
                            ),
                            Text("668,000", style: text14.medium.textColor141414, textAlign: TextAlign.left)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5.ws, right: 5.ws),
            child: Assets.images.imgLike.image(
              width: 24.ws,
              height: 24.ws,
            ),
          ),
        ],
      ),
    );
  }
}
