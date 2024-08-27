import 'package:cats/utils/colors.dart';
import 'package:cats/utils/images.dart';
import 'package:cats/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:cats/utils/size.dart';

class ImageLoaderWidget extends StatelessWidget {
  final Future<String> future;
  const ImageLoaderWidget({
    super.key,
    required this.future,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Image.network(
                  snapshot.data!,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Image.asset(
                            AppImages.loadingIcon,
                          ),
                          Container(
                            height: 300,
                            width: AppSize.screenSize(context).width,
                            color: AppColors.cardColor.withOpacity(0.75),
                          ),
                          CircularProgressIndicator(
                            color: AppColors.primaryColor,
                            strokeWidth: 10,
                          ),
                        ],
                      );
                    }
                  },
                  fit: BoxFit.cover,
                  height: 300,
                  width: AppSize.screenSize(context).width,
                ),
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: AlignmentDirectional.topCenter,
                      end: AlignmentDirectional.bottomCenter,
                      colors: [
                        AppColors.backgroundColor.withOpacity(0),
                        AppColors.backgroundColor,
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset(
                  AppImages.loadingIcon,
                ),
                Container(
                  height: 300,
                  width: AppSize.screenSize(context).width,
                  color: AppColors.cardColor.withOpacity(0.85),
                ),
                Text(
                  "No picture available",
                  style: AppStyles.title,
                ),
              ],
            );
          }
        } else {
          return Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Image.asset(
                AppImages.loadingIcon,
              ),
              Container(
                height: 300,
                width: AppSize.screenSize(context).width,
                color: AppColors.cardColor.withOpacity(0.75),
              ),
              CircularProgressIndicator(
                color: AppColors.primaryColor,
                strokeWidth: 10,
              ),
            ],
          );
        }
      },
    );
  }
}
