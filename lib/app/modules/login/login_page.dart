import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planrep_mobile/app/theme/app_theme.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'login_cotroller.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: ReactiveForm(
                    formGroup: controller.loginForm,
                    child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ReactiveTextField(
                              formControlName: 'email',
                              decoration: inputDecoration('Email'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ReactiveTextField(
                              formControlName: 'password',
                              decoration: inputDecoration("Password"),
                              obscureText: true,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                                onPressed: () => controller.login(),
                                child: Text('Login')),
                          ],
                        ))))));
  }
}
