import 'package:breaking_info/core/generics/resource.dart';
import 'package:breaking_info/core/theme/colors/colors_app.dart';
import 'package:breaking_info/core/theme/fonts/fonts_app.dart';
import 'package:breaking_info/core/widgets/app_bar/custom_app_bar.dart';
import 'package:breaking_info/core/widgets/button/custom_button.dart';
import 'package:breaking_info/core/widgets/textfield/custom_textfield.dart';
import 'package:breaking_info/features/login/view/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginPage extends StatelessWidget {
  final _controller = Modular.get<LoginController>();
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsApp.defaultYellow,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Hero(
                  tag: "logo",
                  child: Image.asset(
                    "images/logo.png",
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Expanded(
                flex: 8,
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorsApp.defaultBlack,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(40.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Login",
                          style: FontsApp.mainFontText36.copyWith(
                            color: ColorsApp.defaultWhite,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Observer(
                          builder: (_) {
                            return CustomTextField(
                              labelText: "Email",
                              onChanged: _controller.changeEmail,
                              keyboardType: TextInputType.emailAddress,
                            );
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Observer(
                          builder: (_) {
                            return CustomTextField(
                              labelText: "Password",
                              keyboardType: TextInputType.text,
                              maxLength: 12,
                              isObscure: !_controller.isPasswordVisible,
                              onChanged: _controller.changePassword,
                              suffixIcon: IconButton(
                                icon: _controller.isPasswordVisible
                                    ? Icon(
                                        Icons.visibility,
                                        color: ColorsApp.defaultYellow,
                                      )
                                    : Icon(
                                        Icons.visibility_off,
                                        color: ColorsApp.defaultYellow,
                                      ),
                                onPressed: _controller.changePasswordVisibility,
                              ),
                            );
                          },
                        ),
                        TextButton(
                          onPressed: () async {
                            await Modular.to.pushNamed(
                              '/register/',
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "First time here? Register",
                                style: FontsApp.mainFontText16.copyWith(
                                    color: ColorsApp.defaultWhite,
                                    decoration: TextDecoration.underline),
                              ),
                            ],
                          ),
                        ),
                        Observer(
                          builder: (_) {
                            return CustomButton(
                              onPressed: _controller.areCredentialsValid
                                  ? () async {
                                      _controller.setButtonToLoadingStatus();
                                      final resource =
                                          await _controller.loginUser();
                                      await _controller.localSaveCredentials();
                                      if (resource.hasError) {
                                        //TO DO: DEAL WITH IT
                                        debugPrint("DEU RUIM PORRA");
                                      }

                                      if (resource.status == Status.success) {
                                        await Modular.to.pushReplacementNamed(
                                            '/home/',
                                            arguments: {
                                              'first_name': _controller
                                                  .user.data!.firstName,
                                              'last_name': _controller
                                                  .user.data!.lastName,
                                            });
                                      }
                                    }
                                  : null,
                              child: Text(
                                "Sign In",
                                style: FontsApp.mainFontText36.copyWith(
                                  color: _controller.areCredentialsValid
                                      ? ColorsApp.defaultBlack
                                      : ColorsApp.defaultWhite,
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
