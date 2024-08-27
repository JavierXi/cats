import 'package:cats/utils/colors.dart';
import 'package:cats/utils/styles.dart';
import 'package:flutter/material.dart';

class CatDetailAppbarWidget extends StatelessWidget {
  final String? catBreedName;
  final Function onPressBack;
  const CatDetailAppbarWidget({
    super.key,
    this.catBreedName,
    required this.onPressBack,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.backgroundColor,
      leading: IconButton(
        onPressed: () => onPressBack(),
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColors.textColor,
        ),
      ),
      title: Text(
        catBreedName ?? "Unknown",
        style: AppStyles.title,
      ),
      centerTitle: true,
    );
  }
}
