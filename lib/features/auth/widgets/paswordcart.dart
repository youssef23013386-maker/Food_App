import 'package:flutter/material.dart';
import 'package:food_app/core/constants/app_fonts.dart';
import 'package:food_app/core/constants/app_images.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/styles/app_text_styles.dart';
import 'package:food_app/core/widgets/app_button.dart';
import 'package:food_app/core/widgets/app_password_form_field.dart';
import 'package:food_app/core/widgets/app_text_form_field.dart';
import 'package:food_app/core/widgets/custom_svg_picture.dart';
import 'package:food_app/features/auth/screens/forget_password_screen.dart';
import 'package:food_app/features/auth/screens/signup_screen.dart';

class paswordcart extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final bool rememberMe;
  final ValueChanged<bool> onRememberChanged;

  const paswordcart({
    required this.formKey,
    required this.rememberMe,
    required this.onRememberChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(32, 32, 32, 20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Email
              Text(
                'Email',
                style: TextStyles.body.copyWith(
                  color: AppColors.ightColor,
                  fontWeight: FontWeight.w400,
                  fontFamily: AppFonts.Sen,
                ),
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                keyboardType: TextInputType.emailAddress,
                hintText: 'example@gmail.com',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 30),

              /// Login Button
              Center(
                child: MainButton(
                  text: 'SEND CODE',
                  onPressed: () {
                    {
                      // Login logic
                    }
                  },
                ),
              ),

              SizedBox(height: 340),
            ],
          ),
        ),
      ),
    );
  }
}
