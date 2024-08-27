import 'package:cats/cats/presentation/controllers/cats_controller.dart';
import 'package:cats/splash/controllers/splash_controller.dart';
import 'package:cats/utils/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashController()),
        ChangeNotifierProvider(create: (_) => CatsController()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Cats',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
          useMaterial3: true,
        ),
        routerConfig: AppGoRouter.all,
      ),
    );
  }
}
