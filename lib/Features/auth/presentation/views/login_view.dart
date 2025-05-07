import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/Core/services/get_it_service.dart';
import 'package:fruits_hub/Features/auth/domain/repo/auth_repo.dart';
import 'package:fruits_hub/Features/auth/presentation/manger/login_cubit/cubit/login_cubit.dart';
import 'package:fruits_hub/Features/auth/presentation/views/widgets/login_body_bloc_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit (getIt<AuthRepo>()),
      child: const Scaffold(body: LoginBodyBlocConsumer()),
    );
  }
}
