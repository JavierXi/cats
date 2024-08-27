import 'package:cats/cats/presentation/widgets/image_loader_widget.dart';
import 'package:cats/cats/domain/models/cat_model.dart';
import 'package:cats/utils/colors.dart';
import 'package:cats/utils/images.dart';
import 'package:cats/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:cats/utils/size.dart';

class CatCardWidget extends StatelessWidget {
  final CatModel cat;
  final VoidCallback onTap;
  final Future<String> function;

  const CatCardWidget({
    super.key,
    required this.cat,
    required this.onTap,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardColor,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: Container(
        height: 400,
        width: AppSize.screenSize(context).width,
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    cat.name ?? "Unknown",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.title,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    color: Colors.transparent,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    child: Text(
                      "More",
                      style: AppStyles.subtitleSmall,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: SizedBox(
                height: 300,
                width: AppSize.screenSize(context).width,
                child: ImageLoaderWidget(
                  future: function,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Image.asset(
                        AppImages.locationIcon,
                        height: 32,
                      ),
                      Expanded(
                        child: Text(
                          cat.origin ?? "Unknown",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.subtitleSmall,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Image.asset(
                      AppImages.brainIcon,
                      height: 32,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      cat.intelligence.toString(),
                      style: AppStyles.subtitleSmall,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
