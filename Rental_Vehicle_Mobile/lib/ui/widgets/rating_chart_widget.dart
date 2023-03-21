import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '/res/style.dart';
import '/res/theme/theme_service.dart';

class RatingChartWidget extends StatelessWidget {
  final double? chartWidth;
  final double? chartHeight;

  RatingChartWidget({this.chartWidth = 180, this.chartHeight = 8});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("4.2", style: text34.bold.textColor141414, textAlign: TextAlign.left),
              RatingBarIndicator(
                rating: 4.2,
                itemCount: 5,
                itemSize: 18.0,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, _) => Assets.images.imgIconStar.image(
                  width: 18.ws,
                  height: 18.ws,
                ),
              ),
              SizedBox(
                height: 6.ws,
              ),
              Text("( 14 đánh giá)", style: text12.textColor141414, textAlign: TextAlign.left)
            ],
          ),
          const Spacer(),
          Column(
            children: [
              _chartRow(context, 5, 50),
              SizedBox(
                height: 13.ws,
              ),
              _chartRow(context, 4, 30),
              SizedBox(
                height: 13.ws,
              ),
              _chartRow(context, 3, 10),
              SizedBox(
                height: 13.ws,
              ),
              _chartRow(context, 2, 8),
              SizedBox(
                height: 13.ws,
              ),
              _chartRow(context, 1, 2)
            ],
          )
        ],
      ),
    );
  }

  Widget _chartRow(BuildContext context, int numnerStart, int pct) {
    return Row(
      children: [
        Text("${numnerStart} sao", style: text12.textColor141414, textAlign: TextAlign.left),
        SizedBox(
          width: 8.ws,
        ),
        Stack(children: [
          Container(
            width: chartWidth,
            height: chartHeight,
            decoration: BoxDecoration(color: const Color(0xffebebec), borderRadius: BorderRadius.circular(chartHeight!)),
            child: const Text(''),
          ),
          Container(
            width: chartWidth! * (pct / 100),
            height: chartHeight,
            decoration: BoxDecoration(color: getColor().themeColorFF6F15, borderRadius: BorderRadius.circular(chartHeight!)),
            child: const Text(''),
          ),
        ]),
      ],
    );
  }
}
