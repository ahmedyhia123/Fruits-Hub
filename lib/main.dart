import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/Core/Helper/on_generate_routes.dart';
import 'package:fruits_hub/Core/services/Shared_preference.dart';
import 'package:fruits_hub/Core/services/custom_bloc_observer.dart';
import 'package:fruits_hub/Core/services/get_it_service.dart';
import 'package:fruits_hub/Features/splash/presentation/views/splash_view.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceHelper.init();
  Bloc.observer = CustomBlocObserver();
  setup(); //Get It
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Cairo',
      ),
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
