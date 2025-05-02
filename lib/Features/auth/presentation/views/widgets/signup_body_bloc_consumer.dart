import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/Features/auth/presentation/manger/signup_cubit/signup_cubit_cubit.dart';
import 'package:fruits_hub/Features/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

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
        return ModalProgressHUD(
          inAsyncCall: state is SignupCubitLoading,
          child: SignupViewBody(),
        );
      },
    );
  }
}
