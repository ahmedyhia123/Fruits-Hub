import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/Core/utils/app_colors.dart';
import 'package:fruits_hub/Core/utils/app_images.dart';
import 'package:fruits_hub/Core/utils/styles.dart';
import 'package:fruits_hub/Core/widgets/ao_widget.dart';
import 'package:fruits_hub/Core/widgets/custom_button.dart';
import 'package:fruits_hub/Features/auth/presentation/manger/login_cubit/cubit/login_cubit.dart';
import 'package:fruits_hub/Features/auth/presentation/views/signup_view.dart';
import 'package:fruits_hub/Features/auth/presentation/views/widgets/custom_app_bar.dart';
import 'package:fruits_hub/Features/auth/presentation/views/widgets/custom_form_field.dart';
import 'package:fruits_hub/Features/auth/presentation/views/widgets/login_by_widget.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});
  

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final isAndroid =  Platform.isAndroid; 
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  AutovalidateMode validator = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    late String email, password;
    return SafeArea(
      child: Form(
        key: key,
        autovalidateMode: validator,
        child: ListView(
          children: [
            const CustomAppBar(text: "تسجيل الدخول"),
            const SizedBox(height: 24),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomFormField(
                    onSaved: (p0) {
                      email = p0!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'من فضلك ادخل الايميل';
                      }
                      final emailRegex = RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      );
                      if (!emailRegex.hasMatch(value)) {
                        return 'من فضلك ادخل ايميل صحيح';
                      }
                      return null;
                    },
                    text: 'البريد الإلكتروني',
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomFormField(
                    onSaved: (p0) {
                      password = p0!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'من فضلك ادخل الباسورد';
                      }

                      return null;
                    },
                    text: 'كلمة المرور',
                    isPassword: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
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
            const SizedBox(height: 37),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomButton(
                text: 'تسجيل دخول',
                onPressed: () {
                  if (key.currentState!.validate()) {
                    key.currentState!.save();
                    context.read<LoginCubit>().login(email, password);
                  } else {
                    setState(() {
                      validator = AutovalidateMode.always;
                    });
                  }
                },
              ),
            ),
            const SizedBox(height: 33),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'لا تملك حساب؟',
                  style: Styles.semiBold19.copyWith(
                    color: const Color(0xff949D9E),
                  ),
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
            const SizedBox(height: 37),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),

              child: AoWidget(),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LoginByWidget(
                onTap: () {
                  context.read<LoginCubit>().loginWithGoogle();
                },
                text: 'تسجيل بواسطة جوجل',
                logo: Assets.assetsImagesGoogle,
              ),
            ),
             SizedBox(height: isAndroid ?  0 : 16),
            isAndroid ? const SizedBox(height: 0,) : const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: LoginByWidget(
                text: 'تسجيل بواسطة أبل',
                logo: Assets.assetsImagesApple,
              ),
            ) ,
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LoginByWidget(
                onTap: () {
                  context.read<LoginCubit>().loginWithFacebook();
                },
                text: 'تسجيل بواسطة فيسبوك',
                logo: Assets.assetsImagesFacebook,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
