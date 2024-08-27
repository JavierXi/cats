import 'package:cats/utils/colors.dart';
import 'package:cats/utils/size.dart';
import 'package:cats/utils/styles.dart';
import 'package:flutter/material.dart';

class ScoreWidget extends StatelessWidget {
  final String label;
  final double score;
  const ScoreWidget({
    super.key,
    required this.label,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    double horizontalPadding = 16;
    double finalScore = (score * 2) / 10;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 12,
        horizontal: horizontalPadding,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppStyles.subtitleSmall,
          ),
          const SizedBox(height: 4),
          Stack(
            children: [
              Container(
                height: 16,
                width: AppSize.screenSize(context).width - (horizontalPadding * 2),
                decoration: BoxDecoration(
                  color: AppColors.hintTextColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Container(
                height: 16,
                width: (AppSize.screenSize(context).width - (horizontalPadding * 2)) * finalScore,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
