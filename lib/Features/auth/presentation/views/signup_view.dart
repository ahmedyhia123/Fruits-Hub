import 'package:flutter/material.dart';
import 'package:fruits_hub/Core/services/get_it_service.dart';
import 'package:fruits_hub/Features/auth/domain/repo/auth_repo.dart';
import 'package:fruits_hub/Features/auth/presentation/manger/signup_cubit/signup_cubit_cubit.dart';
import 'package:fruits_hub/Features/auth/presentation/views/widgets/signup_body_bloc_consumer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const String routeName = 'Signup';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child:  Scaffold(
        body: SignupBodyBlocConsumer(),
      ),
    );
  }
}


