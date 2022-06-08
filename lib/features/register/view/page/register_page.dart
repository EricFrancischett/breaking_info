import 'package:breaking_info/core/generics/resource.dart';
import 'package:breaking_info/features/register/view/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterPage extends StatelessWidget {
  final _controller = Modular.get<RegisterController>();
  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Observer(
              builder: (_) {
                return TextField(
                  decoration: InputDecoration(hintText: "First Name"),
                  onChanged: _controller.changeFirstName,
                );
              },
            ),
            Observer(
              builder: (_) {
                return TextField(
                  decoration: InputDecoration(hintText: "Last Name"),
                  onChanged: _controller.changeLastName,
                );
              },
            ),
            Observer(
              builder: (_) {
                return TextField(
                  decoration: InputDecoration(hintText: "Email"),
                  onChanged: _controller.changeEmail,
                );
              },
            ),
            Observer(
              builder: (_) {
                return TextField(
                  obscureText: !_controller.isPasswordVisible,
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: IconButton(
                      icon: _controller.isPasswordVisible
                          ? const Icon(
                              Icons.visibility,
                            )
                          : const Icon(
                              Icons.visibility_off,
                            ),
                      onPressed: _controller.changePasswordVisibility,
                    ),
                  ),
                  onChanged: _controller.changePassword,
                );
              },
            ),
            Observer(
              builder: (_) {
                return TextField(
                  obscureText: !_controller.isPasswordConfirmationVisible,
                  decoration: InputDecoration(
                    hintText: "Confirm password",
                    suffixIcon: IconButton(
                      icon: _controller.isPasswordConfirmationVisible
                          ? const Icon(
                              Icons.visibility,
                            )
                          : const Icon(
                              Icons.visibility_off,
                            ),
                      onPressed: _controller.changePasswordConfirmationVisibility,
                    ),
                  ),
                  onChanged: _controller.changePasswordConfirmation,
                );
              },
            ),
            Observer(builder: (_) {
              return ElevatedButton(
                onPressed: _controller.allCredentialIsValid
                    ? () async {
                        _controller.setButtonToLoadingStatus();
                        final resource = await _controller.registerUser();
                        if (resource.hasError) {
                          //TO DO: DEAL WITH IT
                          debugPrint("DEU RUIM PORRA");
                        }
                        if (resource.status == Status.success) {
                          await Modular.to.pushNamed(Modular.initialRoute);
                          debugPrint("DEU BOM PORRA");
                        }
                      }
                    : null,
                child: const Text("Sign In"),
              );
            })
          ],
        ),
      ),
    );
  }
}
