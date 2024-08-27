import 'package:cats/cats/domain/models/cat_model.dart';
import 'package:cats/utils/images.dart';
import 'package:cats/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:cats/utils/size.dart';

class CatBreedWeightWidget extends StatelessWidget {
  final CatModel cat;
  final String catweight;
  const CatBreedWeightWidget({
    super.key,
    required this.cat,
    required this.catweight,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: AppSize.screenSize(context).width * 0.5 - 16,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.weightIcon,
                  width: 24,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    catweight,
                    style: AppStyles.subtitleSmall,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: AppSize.screenSize(context).width * 0.5 - 16,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.clockIcon,
                  width: 24,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    "${cat.lifeSpan} years",
                    style: AppStyles.subtitleSmall,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
