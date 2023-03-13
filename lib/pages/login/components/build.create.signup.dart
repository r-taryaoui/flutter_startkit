import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ma_friperie/components/general/static.line.dart';
import 'package:ma_friperie/pages/login/controllers/app.login.controller.dart';

class SignInCreateSection extends StatelessWidget {
  const SignInCreateSection({super.key});

  @override
  Widget build(BuildContext context) {
    AppLoginController appLoginController = Get.find();
    return SizedBox(
      height: 160,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const StaticLine(
              title: "Créer un compte",
              lineWidth: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: ElevatedButton(
                onPressed: () {
                  appLoginController.resetLoginFom(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Spacer(),
                      Text(
                        "Créer un compte",
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
            ),
          ],
        ),
      ),
    );
  }
}
