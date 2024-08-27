import 'package:cats/splash/controllers/splash_controller.dart';
import 'package:go_router/go_router.dart';
import 'package:cats/utils/colors.dart';
import 'package:cats/utils/images.dart';
import 'package:cats/utils/routes.dart';
import 'package:cats/utils/styles.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:cats/utils/size.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      SplashController controller =
          Provider.of<SplashController>(context, listen: false);
      controller.initFunction();
      await Future.delayed(
        const Duration(seconds: 3),
        () => context.pushReplacement(AppRoutes.catsView),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SizedBox(
          width: AppSize.screenSize(context).width,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.appIcon,
                width: 200,
              ),
              const SizedBox(height: 24),
              Text(
                "CATBREEDS",
                style: AppStyles.display,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
