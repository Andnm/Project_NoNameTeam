import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

import 'image_item_widget.dart';
import 'photo_provider.dart';

class ListGroupPhotoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListGroupPhotoScreenState();
}

class _ListGroupPhotoScreenState extends State<ListGroupPhotoScreen> {
  PhotoProvider get photoProvider => Get.find<PhotoProvider>();

  ThumbnailOption get thumbOption => const ThumbnailOption(
        size: ThumbnailSize(
          65,
          65,
        ),
      );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: ListView.separated(
          padding: const EdgeInsetsDirectional.only(top: 1.0),
          itemCount: photoProvider.listGallarys.length,
          itemBuilder: (_, int index) => InkWell(
            child: (photoProvider.listThumb.length == photoProvider.listGallarys.length) ? _itemViewPhotoThumb(index) : _itemView(index),
            onTap: () {
              photoProvider.onChangedGallary(index);
            },
          ),
          separatorBuilder: (BuildContext _, int __) => Container(
            height: 0.5,
            color: Colors.black12,
          ),
        ),
      ),
    );
  }

  Widget _itemViewPhotoThumb(int index) {
    var item = photoProvider.listGallarys[index];
    var thumb = photoProvider.listThumb[index];
    return Container(
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: ImageItemWidget(
              key: ValueKey(thumb),
              entity: thumb,
              option: thumbOption,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                "${item.assetCountAsync}",
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              )
            ],
          ),
          const Spacer(),
          if (index == photoProvider.gallaryIndex)
            const Icon(
              Icons.check,
              size: 24,
              color: Colors.green,
            ),
        ],
      ),
    );
  }

  Widget _itemView(int index) {
    var item = photoProvider.listGallarys[index];
    return Container(
        height: 80,
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "${item.assetCount}",
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const Spacer(),
            if (index == photoProvider.gallaryIndex)
              const Icon(
                Icons.check,
                size: 24,
                color: Colors.green,
              ),
          ],
        ));
  }
}
