import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/Core/utils/app_colors.dart';
import 'package:fruits_hub/Core/utils/styles.dart';
import 'package:fruits_hub/Core/widgets/custom_button.dart';
import 'package:fruits_hub/Features/auth/presentation/manger/signup_cubit/signup_cubit_cubit.dart';
import 'package:fruits_hub/Features/auth/presentation/views/widgets/custom_app_bar.dart';
import 'package:fruits_hub/Features/auth/presentation/views/widgets/custom_form_field.dart';
import 'package:fruits_hub/Features/auth/presentation/views/widgets/term_and_con.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  AutovalidateMode validator = AutovalidateMode.disabled;
  late bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    late String name, email, password;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: key,
          autovalidateMode: validator,
          child: ListView(
            children: [
              CustomAppBar(
                text: "حساب جديد",
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 24),
              CustomFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'هذا الحقل مطلوب';
                  } else {
                    return null;
                  }
                },
                text: 'الاسم كامل',
                onSaved: (p0) {
                  name = p0!;
                },
              ),
              const SizedBox(height: 16),
              CustomFormField(
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
                onSaved: (p0) {
                  email = p0!;
                },
              ),
              const SizedBox(height: 16),
              CustomFormField(
                validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'من فضلك ادخل الباسورد';
                    }
                    if (value.length < 6) {
                      return 'الرقم السري يجب ان لا يقل عن 6 احرف';
                    }

                    return null;
                  },
                text: 'كلمة المرور',
                isPassword: true,
                onSaved: (p0) {
                  password = p0!;
                },
              ),
              const SizedBox(height: 16),
              TermAndCon(
                onChanged: (value) {
                  isTermsAccepted = value;
                },
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: 'إنشاء حساب جديد',
                onPressed: () {
                  if (key.currentState!.validate()) {
                    key.currentState!.save();
                    if (isTermsAccepted) {
                      context
                          .read<SignupCubit>()
                          .createUserWithEmailAndPassword(
                            email: email,
                            password: password,
                            name: name,
                          );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'يجب عليك الموافقة علي الشروط والاحكام ',
                          ),
                        ),
                      );
                    }
                  } else {
                    setState(() {
                      validator = AutovalidateMode.always;
                    });
                  }
                },
              ),
              const SizedBox(height: 26),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'تمتلك حساب بالفعل؟',
                    style: Styles.semiBold19.copyWith(
                      color: const Color(0xff949D9E),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'تسجيل دخول',
                      style: Styles.semiBold19.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
