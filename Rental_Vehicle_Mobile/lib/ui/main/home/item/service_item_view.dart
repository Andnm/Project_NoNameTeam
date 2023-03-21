import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/data/api/models/service_item.dart';
import '/res/style.dart';
import '/res/theme/theme_service.dart';

class ServiceItemView extends StatefulWidget {
  final ServiceItem item;
  final double width;
  final double height;
  final Function(ServiceItem) onTap;

  ServiceItemView({required this.item, required this.width, required this.height, required this.onTap});

  @override
  State<StatefulWidget> createState() => _ServiceItemViewState();
}

class _ServiceItemViewState extends State<ServiceItemView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          widget.onTap(widget.item);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10.ws)),
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: getColor().themeColorEBEBEC, offset: Offset(0, 5), blurRadius: 15, spreadRadius: 0)],
                color: getColor().themeColorWhite),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: 60.ws,
                    height: 60.ws,
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), color: getColor().themeColorE5F2FF),
                    child: Center(
                      child: Image.asset(
                        widget.item.icon,
                        width: 32.ws,
                        height: 32.ws,
                      ),
                    )),
                SizedBox(
                  height: 10.hs,
                ),
                Text(
                  widget.item.keyName,
                  textAlign: TextAlign.center,
                  style: text12.medium.textColor141414,
                  maxLines: 2,
                )
              ],
            ),
          ),
        ));
  }
}
