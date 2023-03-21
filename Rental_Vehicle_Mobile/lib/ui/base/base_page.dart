import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/ui/widgets/data_error_widget.dart';
import '/ui/widgets/loading_widget.dart';
import 'base_controller.dart';

//ignore: must_be_immutable
abstract class BasePage<C extends BaseController> extends GetWidget<C> {
  late Size screen;

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size;
    return Obx(() => buildViewState(context));
  }

  Widget buildViewState(BuildContext context) {
    switch (controller.viewState.value) {
      case ViewState.error:
        return DataErrorWidget(messageError: controller.errorMessage, onReloadData: controller.onReloadData);
      case ViewState.loaded:
      case ViewState.loading:
        return Stack(
          children: [buildContentView(context, controller), if (controller.viewState.value == ViewState.loading) buildLoadingView],
        );
      default:
        return const SizedBox(
          width: 0,
          height: 0,
        );
    }
  }

  Widget buildDefaultLoading() {
    return const Center(
        child: LoadingWidget(
      radius: 16,
    ));
  }

  Widget buildContentView(BuildContext context, C controller);

  Widget get buildLoadingView => buildDefaultLoading();
}

enum ViewState { initial, loading, loaded, error }
