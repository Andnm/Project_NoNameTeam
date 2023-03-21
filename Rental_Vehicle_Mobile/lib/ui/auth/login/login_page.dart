import 'package:flutter/material.dart';

import '/res/style.dart';
import '/res/theme/theme_service.dart';
import '/ui/auth/login/login_controller.dart';
import '/ui/base/base_page.dart';
import '/ui/widgets/button/custom_button.dart';
import '../../widgets/input/text_form_field_widget.dart';

//ignore: must_be_immutable
class LoginPage extends BasePage<LoginController> {
  @override
  Widget buildContentView(BuildContext context, LoginController controller) {
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
                buildWidgetLogin(controller),
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

  buildWidgetLogin(LoginController controller) => Center(
        child: Column(
          children: [
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
            DTextFromField(
              hintText: LocalString.password,
              obscureText: controller.isShowPass.value,
              maxLength: 10,
              suffixIcon: InkWell(
                onTap: controller.showPass,
                child: controller.isShowPass.value ? Assets.icons.icVisible.svg() : Assets.icons.icInvisible.svg(),
              ),
              keyboardType: TextInputType.visiblePassword,
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
