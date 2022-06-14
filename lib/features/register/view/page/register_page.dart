import 'package:breaking_info/core/generics/resource.dart';
import 'package:breaking_info/core/theme/colors/colors_app.dart';
import 'package:breaking_info/core/theme/fonts/fonts_app.dart';
import 'package:breaking_info/core/widgets/app_bar/custom_app_bar.dart';
import 'package:breaking_info/core/widgets/button/custom_button.dart';
import 'package:breaking_info/core/widgets/textfield/custom_textfield.dart';
import 'package:breaking_info/features/register/view/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/widgets/dialog/custom_dialog.dart';

class RegisterPage extends StatelessWidget {
  final _controller = Modular.get<RegisterController>();
  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.defaultYellow,
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.84,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 13,
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
                            "Register",
                            style: FontsApp.mainFontText36.copyWith(
                              color: ColorsApp.defaultWhite,
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Observer(
                            builder: (_) {
                              return CustomTextField(
                                labelText: "First Name",
                                onChanged: _controller.changeFirstName,
                                keyboardType: TextInputType.name,
                              );
                            },
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Observer(
                            builder: (_) {
                              return CustomTextField(
                                labelText: "Last Name",
                                onChanged: _controller.changeLastName,
                                keyboardType: TextInputType.name,
                              );
                            },
                          ),
                          const SizedBox(
                            height: 8,
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
                                  onPressed:
                                      _controller.changePasswordVisibility,
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Observer(
                            builder: (_) {
                              return CustomTextField(
                                labelText: "Confirm Password",
                                keyboardType: TextInputType.text,
                                maxLength: 12,
                                isObscure:
                                    !_controller.isPasswordConfirmationVisible,
                                onChanged:
                                    _controller.changePasswordConfirmation,
                                suffixIcon: IconButton(
                                  icon:
                                      _controller.isPasswordConfirmationVisible
                                          ? Icon(
                                              Icons.visibility,
                                              color: ColorsApp.defaultYellow,
                                            )
                                          : Icon(
                                              Icons.visibility_off,
                                              color: ColorsApp.defaultYellow,
                                            ),
                                  onPressed: _controller
                                      .changePasswordConfirmationVisibility,
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Observer(
                            builder: (_) {
                              return CustomButton(
                                onPressed: _controller.allCredentialIsValid
                                    ? () async {
                                        _controller.setButtonToLoadingStatus();
                                        final resource =
                                            await _controller.registerUser();
                                        await _controller
                                            .localSaveCredentials();
                                        if (resource.hasError) {
                                          await showDialog(
                                            context: context,
                                            builder: (context) {
                                              return CustomDialog(
                                                errorMessage:
                                                    "Please, try again",
                                                onPressed: () {
                                                  Modular.to.pop();
                                                  _controller
                                                      .setButtonToNotLoadingStatus;
                                                },
                                              );
                                            },
                                          );
                                          _controller
                                              .setButtonToNotLoadingStatus;
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
                                child: _controller.isButtonAtLoadingStatus
                                    ? Lottie.asset(
                                        'images/loading_circle_black.json',
                                        height: 64,
                                        width: 128,
                                        alignment: Alignment.center,
                                        fit: BoxFit.fill,
                                      )
                                    : Text(
                                        "Sign Up",
                                        style: FontsApp.mainFontText36.copyWith(
                                          color:
                                              _controller.allCredentialIsValid
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
