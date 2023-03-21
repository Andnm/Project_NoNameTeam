import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/app_pages.dart';
import '/data/api/models/service_hot_item.dart';
import '/res/style.dart';
import '/res/theme/theme_service.dart';
import '/ui/widgets/image_widget.dart';

class ServiceStaggeredItemView extends StatefulWidget {
  final HotServiceItem item;
  final double width;

  ServiceStaggeredItemView({required this.item, required this.width});

  @override
  State<StatefulWidget> createState() => _ServiceStaggeredItemViewState();
}

class _ServiceStaggeredItemViewState extends State<ServiceStaggeredItemView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.toNamed(AppRoutes.PLACE_DETAIL);
        },
        child: Container(
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8.ws)),
                child: Container(
                  width: widget.width,
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
                            Text(widget.item.name, style: text16.bold.textColor141414, textAlign: TextAlign.left),
                            SizedBox(
                              height: 8.ws,
                            ),
                            Row(
                              children: [
                                Text("từ", style: text12.textColor777777, textAlign: TextAlign.left),
                                SizedBox(
                                  width: 4.ws,
                                ),
                                Text("668,000", style: text14.medium.textColor141414, textAlign: TextAlign.left),
                              ],
                            ),
                            SizedBox(
                              height: 15.hs,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5.ws, right: 5.ws),
                child: widget.item.isFavorite!
                    ? Assets.images.imgLikeActive.image(
                        width: 24.ws,
                        height: 24.ws,
                      )
                    : Assets.images.imgLike.image(
                        width: 24.ws,
                        height: 24.ws,
                      ),
              ),
            ],
          ),
        ));
  }
}
