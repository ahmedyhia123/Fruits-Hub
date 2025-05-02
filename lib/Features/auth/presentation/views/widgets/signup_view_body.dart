
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
              SizedBox(height: 24),
              CustomFormField(
                text: 'الاسم كامل',
                onSaved: (p0) {
                  name = p0!;
                },
              ),
              SizedBox(height: 16),
              CustomFormField(
                text: 'البريد الإلكتروني',
                onSaved: (p0) {
                  email = p0!;
                },
              ),
              SizedBox(height: 16),
              CustomFormField(
                text: 'كلمة المرور',
                isPassword: true,
                onSaved: (p0) {
                  password = p0!;
                },
              ),
              SizedBox(height: 16),
              TermAndCon(),
              SizedBox(height: 30),
              CustomButton(
                text: 'إنشاء حساب جديد',
                onPressed: () {
                  if (key.currentState!.validate()) {
                    key.currentState!.save();
                    context.read<SignupCubit>().createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                      name: name,
                    );
                  } else {
                    setState(() {
                      validator = AutovalidateMode.always;
                    });
                  }
                },
              ),
              SizedBox(height: 26),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'تمتلك حساب بالفعل؟',
                    style: Styles.semiBold19.copyWith(color: Color(0xff949D9E)),
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
