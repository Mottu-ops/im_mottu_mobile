import 'package:flutter/material.dart';
import 'package:marvel/presentation/router/routes.dart';
import 'package:marvel/presentation/splash/view/splash_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const SplashView());

  Future.delayed(const Duration(milliseconds: 6000))
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routes.goRouter,
      debugShowCheckedModeBanner: false,
      title: 'Mottul Marvel',
    );
  }
}
