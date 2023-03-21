import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/data/api/respositories/user_repository.dart';
import '/ui/base/base_controller.dart';
import '../../../app/app_pages.dart';
import '../../../libraries/logger/flutter_logger.dart';
import '../../base/base_page.dart';

class RegisterController extends BaseController {
  final userRepository = Get.find<UserRepository>();

  ViewState get initState => ViewState.loaded;
  final buttonEnable = false.obs;
  final isLoading = false.obs;
  final formKey = GlobalKey<FormState>();
  TextEditingController textFirstNameCl = TextEditingController();
  TextEditingController textLastNameCl = TextEditingController();
  TextEditingController textEmailCl = TextEditingController();
  TextEditingController textPasswordCl = TextEditingController();

  @override
  int get typeViewNoti => 3;

  bool get validate => GetUtils.isEmail(textEmailCl.text) && GetUtils.isLengthGreaterOrEqual(textPasswordCl.text, 5);

  @override
  void onInit() {
    super.onInit();
    textEmailCl.addListener(_controllerListener);
    textPasswordCl.addListener(_controllerListener);
  }

  void _controllerListener() {
    formKey.currentState?.validate();
    buttonEnable.value = validate;
  }

  String? invalidEmail(String fieldName) {
    return GetUtils.isNullOrBlank(textEmailCl.text) == true || !GetUtils.isEmail(textEmailCl.text)
        ? 'sign_up_msg_invalid_email'.trParams({
            'field': fieldName,
          })
        : null;
  }

  String? passwordValidator(String fieldName) {
    return (GetUtils.isNullOrBlank(textPasswordCl.text) == true)
        ? 'sign_up_msg_is_required'.trParams(
            {
              'field': fieldName,
            },
          )
        : GetUtils.isLengthLessThan(textPasswordCl.text, 5)
            ? 'sign_up_msg_is_at_least_6_characters'.trParams(
                {
                  'field': fieldName,
                },
              )
            : null;
  }

  void login() async {
    try {
      isLoading.value = true;
      var token = await userRepository.loginByUser(textEmailCl.text, textPasswordCl.text);
      final userInfo = await userRepository.getUserInfo();
      Logger.e('signIn:$userInfo');
      isLoading.value = false;
      Get.offAllNamed(AppRoutes.MAIN);
    } catch (e) {
      Logger.e(e);
      isLoading.value = false;
      showErrors(e);
    }
  }

  @override
  void dispose() {
    textEmailCl.removeListener(_controllerListener);
    textPasswordCl.removeListener(_controllerListener);
    textEmailCl.dispose();
    textPasswordCl.dispose();
    super.dispose();
  }
}
