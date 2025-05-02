import 'package:flutter/material.dart';
import 'package:fruits_hub/Core/utils/app_colors.dart';
import 'package:fruits_hub/Core/utils/app_images.dart';
import 'package:fruits_hub/Core/utils/styles.dart';
import 'package:fruits_hub/Core/widgets/ao_widget.dart';
import 'package:fruits_hub/Core/widgets/custom_button.dart';
import 'package:fruits_hub/Features/auth/presentation/views/signup_view.dart';
import 'package:fruits_hub/Features/auth/presentation/views/widgets/custom_app_bar.dart';
import 'package:fruits_hub/Features/auth/presentation/views/widgets/custom_form_field.dart';
import 'package:fruits_hub/Features/auth/presentation/views/widgets/login_by_widget.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          CustomAppBar(text: "تسجيل الدخول"),
          SizedBox(height: 24),
          Form(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomFormField(text: 'البريد الإلكتروني'),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomFormField(text: 'كلمة المرور', isPassword: true),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'نسيت كلمة المرور؟',
                  style: Styles.semiBold16.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 37),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomButton(text: 'تسجيل دخول', onPressed: () {}),
          ),
          SizedBox(height: 33),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'لا تملك حساب؟',
                style: Styles.semiBold19.copyWith(color: Color(0xff949D9E)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, SignupView.routeName);
                },
                child: Text(
                  'قم بإنشاء حساب',
                  style: Styles.semiBold19.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 37),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),

            child: const AoWidget(),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: LoginByWidget(
              text: 'تسجيل بواسطة جوجل',
              logo: Assets.assetsImagesGoogle,
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: LoginByWidget(
              text: 'تسجيل بواسطة أبل',
              logo: Assets.assetsImagesApple,
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: LoginByWidget(
              text: 'تسجيل بواسطة فيسبوك',
              logo: Assets.assetsImagesFacebook,
            ),
          ),
        ],
      ),
    );
  }
}
