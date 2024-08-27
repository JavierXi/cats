import 'package:cats/utils/colors.dart';
import 'package:cats/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:cats/utils/size.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.screenSize(context).width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: AppColors.primaryColor,
            strokeWidth: 10,
          ),
          const SizedBox(height: 8),
          Text(
            "Loading...",
            style: AppStyles.title,
          ),
        ],
      ),
    );
  }
}
