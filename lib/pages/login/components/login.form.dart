import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ma_friperie/app/libraries/constants.dart';
import 'package:ma_friperie/components/general/genral.input.dart';
import 'package:ma_friperie/pages/login/components/build.create.signup.dart';
import 'package:ma_friperie/pages/login/components/signin.error.dart';
import 'package:ma_friperie/pages/login/controllers/app.login.controller.dart';

class AppLoginFormSection extends StatelessWidget {
  const AppLoginFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    AppLoginController appLoginController = Get.find();
    return Obx(
      () {
        return Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                AppConstants.appWelcomeMessage,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 40),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "Votre Identifiant :",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  AppInput(
                    autofocus: true,
                    placeholder: "Identifiant",
                    icon: Icons.account_circle,
                    onChangeFunc: (String text) {
                      appLoginController.setUsername(text);
                    },
                    onSubmittedFunc: (String text) {
                      appLoginController.myFocusNode.requestFocus();
                    },
                  )
                ],
              ),
              const SizedBox(height: 20),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "Votre Mot de passe :",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    AppInput(
                      focusNode: appLoginController.myFocusNode,
                      placeholder: "Mot de passe",
                      icon: Icons.key_rounded,
                      isPassword: !appLoginController.showPassword.value,
                      onChangeFunc: (String text) {
                        appLoginController.setPassword(text);
                      },
                      onSubmittedFunc: (String text) {
                        appLoginController.submitLoginFom(context);
                      },
                    ),
                    IconButton(
                      onPressed: appLoginController.togglePasswordView,
                      icon: Icon(
                        appLoginController.showPassword.value
                            ? Icons.lock_open
                            : Icons.lock,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 6),
              if (appLoginController.hasError) const SignInLoginError(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  appLoginController.submitLoginFom(context);
                },
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                    const Size(double.infinity, 50),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Spacer(),
                      Text(
                        "Connexion",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      //print("TextButton pressed : ");
                    },
                    child: const Text(
                      'Mot de passe oublié ?',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
              const SignInCreateSection(),
            ],
          ),
        );
      },
    );
  }
}
