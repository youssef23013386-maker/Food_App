import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/features/auth/widgets/LoginBackground.dart';
import 'package:food_app/features/auth/widgets/passwordbackground.dart';
import 'package:food_app/features/auth/widgets/paswordcart.dart';
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
 final formKey = GlobalKey<FormState>();
 bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.secondaryColor,
        body: SafeArea(
          child: Stack(
            children: [
              const passwordbackground(),
              Align(
                alignment: Alignment.bottomCenter,
                child: paswordcart(
                  formKey: formKey,
                  rememberMe: rememberMe,
                  onRememberChanged: (value) {
                    setState(() {
                      rememberMe = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}