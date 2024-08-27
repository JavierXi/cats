import 'package:cats/cats/domain/models/cat_model.dart';
import 'package:cats/utils/images.dart';
import 'package:cats/utils/styles.dart';
import 'package:flutter/material.dart';

class CatTemperamentWidget extends StatelessWidget {
  final CatModel cat;
  const CatTemperamentWidget({
    super.key,
    required this.cat,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.heartIcon,
            width: 24,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              cat.temperament ?? "Unknown",
              style: AppStyles.subtitleSmall,
            ),
          ),
        ],
      ),
    );
  }
}
