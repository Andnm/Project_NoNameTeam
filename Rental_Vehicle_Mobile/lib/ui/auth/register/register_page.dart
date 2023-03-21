import 'package:flutter/material.dart';

import '/res/style.dart';
import '/res/theme/theme_service.dart';
import '/ui/base/base_page.dart';
import '../../widgets/button/custom_button.dart';
import '../../widgets/input/text_form_field_widget.dart';
import 'register_controller.dart';

//ignore: must_be_immutable
class RegisterPage extends BasePage<RegisterController> {
  @override
  Widget buildContentView(BuildContext context, RegisterController controller) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getColor().bgThemeColorWhite,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.ws),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 60.ws),
                buildWidgetLogo(),
                SizedBox(height: 60.ws),
                buildWidgetRegister(controller),
                SizedBox(height: 60.ws),
                buildWidgetButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildWidgetLogo() => Assets.icons.logo.image(width: 90.ws);

  buildWidgetRegister(RegisterController controller) => Center(
        child: Column(
          children: [
            ClearTextField(
              hint: LocalString.email,
              keyboardType: TextInputType.text,
              controller: controller.textEmailCl,
              contentPadding: const EdgeInsets.only(left: 2, bottom: 6, top: 10),
              onValidated: (val) {
                return controller.invalidEmail(LocalString.email);
              },
            ),
            const SizedBox(height: 8),
            ClearTextField(
              hint: LocalString.email,
              keyboardType: TextInputType.emailAddress,
              controller: controller.textEmailCl,
              contentPadding: const EdgeInsets.only(left: 2, bottom: 6, top: 10),
              onValidated: (val) {
                return controller.invalidEmail(LocalString.email);
              },
            ),
            const SizedBox(height: 8),
            ClearTextField(
              hint: LocalString.password,
              maxLength: 10,
              keyboardType: TextInputType.text,
              controller: controller.textPasswordCl,
              contentPadding: const EdgeInsets.only(left: 2, bottom: 6, top: 10),
              onValidated: (val) {
                return controller.passwordValidator(LocalString.password);
              },
            ),
          ],
        ),
      );

  buildWidgetButton() => CustomButton(
        text: LocalString.login,
        onPressed: controller.login,
        isLoading: controller.isLoading.value,
        isEnable: controller.buttonEnable.value,
        width: screen.width,
        textStyle: text16.bold.textColorWhite,
        height: 42.ws,
        radius: 8,
      );
}
