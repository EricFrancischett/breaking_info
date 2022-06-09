import 'package:breaking_info/core/generics/resource.dart';
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
        appBar: AppBar(),
        body: Column(
          children: [
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
            TextButton(
              onPressed: () async {
                await Modular.to.pushNamed(
                  '/register/',
                );
              },
              child: const Text("First time here? Register"),
            ),
            Observer(
              builder: (_) {
                return ElevatedButton(
                  onPressed: _controller.areCredentialsValid
                      ? () async {
                          _controller.setButtonToLoadingStatus();
                          final resource = await _controller.loginUser();
                          await _controller.localSaveCredentials();
                          if (resource.hasError) {
                            //TO DO: DEAL WITH IT
                            debugPrint("DEU RUIM PORRA");
                          }

                          if (resource.status == Status.success) {
                            await Modular.to.pushNamed(
                              '/home/',
                            );
                          }
                        }
                      : null,
                  child: const Text("Sign In"),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
