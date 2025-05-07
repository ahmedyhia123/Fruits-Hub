import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/Core/widgets/custom_model_progress_HUD.dart';
import 'package:fruits_hub/Features/auth/presentation/manger/signup_cubit/signup_cubit_cubit.dart';
import 'package:fruits_hub/Features/auth/presentation/views/widgets/signup_view_body.dart';

class SignupBodyBlocConsumer extends StatelessWidget {
  const SignupBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupCubitState>(
      listener: (context, state) {
        if (state is SignupCubitSuccess){
          Navigator.pop(context);
        }
        if (state is SignupCubitFailure){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.failure)),
          );
        }
      },
      builder: (context, state) {
        return CustomModelProgressHUD(
          isLoading: state is SignupCubitLoading,
          child: const SignupViewBody(),
        );
      },
    );
  }
}
