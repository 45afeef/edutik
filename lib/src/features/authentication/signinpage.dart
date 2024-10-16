import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'auth_service.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('sign_in_content'.tr),
              AspectRatio(
                aspectRatio: 1,
                child: SvgPicture.asset('assets/images/fingerprint_login.svg'),
              ),
              Obx(
                () => ElevatedButton(
                  onPressed: () {
                    authService.signIn();
                  },
                  child: authService.onLoggingIn.value
                      ? Container(
                          height: 40,
                          width: 40,
                          padding: const EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.onPrimary),
                        )
                      : Text('sign_in_button'.tr),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
