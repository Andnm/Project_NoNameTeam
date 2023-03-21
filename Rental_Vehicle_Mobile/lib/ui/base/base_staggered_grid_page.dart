import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '/res/colors.dart';
import '/res/theme/theme_service.dart';
import '/ui/base/base_grid_controller.dart';
import '/ui/widgets/data_empty_widget.dart';
import 'base_page.dart';

abstract class BaseStaggeredGridPage<I, C extends BaseGridController<I>> extends BasePage<C> {
  EdgeInsets get padding => const EdgeInsets.all(0);

  double get itemSpacing => 0;

  Color get dividerColor => colorWhite;
  int crossAxisCount = 2;

  double childAspectRatio = 1;

  double mainAxisSpacing = 0;

  double crossAxisSpacing = 0;

  bool get shrinkWrap => false;

  Axis get axis => Axis.vertical;

  ScrollPhysics get scrollPhysics => AlwaysScrollableScrollPhysics();
  double gridMarginHorizontal = 0;

  EdgeInsets get paddingGrid => EdgeInsets.symmetric(horizontal: gridMarginHorizontal);

  Color get background => getColor().bgThemeColorWhite;

  Widget buildItem(BuildContext context, I item, int index);

  @override
  Widget buildContentView(BuildContext context, C controller) {
    return Container(
        color: background,
        padding: padding,
        child: (controller.items.isNotEmpty || controller.viewState.value == ViewState.loading)
            ? MasonryGridView.count(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: mainAxisSpacing,
                crossAxisSpacing: crossAxisSpacing,
                itemBuilder: (context, index) {
                  return buildItem(context, controller.items[index], index);
                },
                itemCount: controller.items.length,
              )
            : DataEmptyWidget());
  }

  jumpToTop() {
    controller.scrollController.animateTo(
      0.0,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 300),
    );
  }
}
