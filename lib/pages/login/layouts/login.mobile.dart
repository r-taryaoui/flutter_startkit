import 'package:flutter/material.dart';
import 'package:ma_friperie/pages/login/components/login.form.dart';

class AppLoginMobile extends StatelessWidget {
  const AppLoginMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Se Connecter"),
      ),
      body: const SingleChildScrollView(
        child: AppLoginFormSection(),
      ),
    );
  }
}
