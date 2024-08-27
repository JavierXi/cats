import 'package:cats/cats/domain/models/cat_model.dart';
import 'package:cats/utils/colors.dart';
import 'package:cats/utils/styles.dart';
import 'package:flutter/material.dart';

class CatBreedDescriptionWidget extends StatelessWidget {
  final CatModel cat;
  const CatBreedDescriptionWidget({
    super.key,
    required this.cat,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardColor,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          cat.description ?? "Unknown",
          style: AppStyles.body,
        ),
      ),
    );
  }
}
