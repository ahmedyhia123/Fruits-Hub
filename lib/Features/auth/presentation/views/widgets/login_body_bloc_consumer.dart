import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/Core/widgets/custom_model_progress_HUD.dart';
import 'package:fruits_hub/Features/Home/presentation/views/home_view.dart';
import 'package:fruits_hub/Features/auth/presentation/manger/login_cubit/cubit/login_cubit.dart';
import 'package:fruits_hub/Features/auth/presentation/views/widgets/login_view_body.dart';

class LoginBodyBlocConsumer extends StatelessWidget {
  const LoginBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSucsess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text('تم تسحيل الدخول بنجاح'),
            ),
          );

          Navigator.pushNamed(context, HomeView.routeName);
        }
        if (state is LoginFaliuer) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(backgroundColor: Colors.red, content: Text(state.failure)),
          );
        }
      },
      builder: (context, state) {
        return CustomModelProgressHUD(
          isLoading: state is LoginLoading,
          child: const LoginViewBody(),
        );
      },
    );
  }
}
