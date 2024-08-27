import 'package:cats/cats/presentation/widgets/cat_breed_description_widget.dart';
import 'package:cats/cats/presentation/widgets/cat_detail_appbar_widget.dart';
import 'package:cats/cats/presentation/widgets/cat_breed_weight_widget.dart';
import 'package:cats/cats/presentation/widgets/cat_temperament_widget.dart';
import 'package:cats/cats/presentation/widgets/image_loader_widget.dart';
import 'package:cats/cats/presentation/controllers/cats_controller.dart';
import 'package:cats/cats/presentation/widgets/divider_widget.dart';
import 'package:cats/cats/presentation/widgets/score_widget.dart';
import 'package:cats/cats/domain/models/cat_model.dart';
import 'package:go_router/go_router.dart';
import 'package:cats/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class CatDetailView extends StatelessWidget {
  final CatModel cat;
  const CatDetailView({
    super.key,
    required this.cat,
  });

  @override
  Widget build(BuildContext context) {
    CatsController controller =
        Provider.of<CatsController>(context, listen: false);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: CatDetailAppbarWidget(
          catBreedName: cat.name,
          onPressBack: () => context.pop(context),
        ),
      ),
      body: Column(
        children: [
          ImageLoaderWidget(
            future: controller.getCatImageUrl(
                catReferenceId: cat.referenceImageId ?? ""),
          ),
          Expanded(
            child: Stack(
              children: [
                ListView(
                  padding: const EdgeInsets.only(bottom: 32),
                  children: [
                    CatBreedDescriptionWidget(
                      cat: cat,
                    ),
                    CatBreedWeightWidget(
                      cat: cat,
                      catweight: controller.getCatWeigtht(weight: cat.weight!),
                    ),
                    CatTemperamentWidget(
                      cat: cat,
                    ),
                    const DividerWidget(),

                    /// Affection section
                    ScoreWidget(
                      label: "Social needs",
                      score: cat.socialNeeds?.toDouble() ?? 0.0,
                    ),
                    ScoreWidget(
                      label: "Affection level",
                      score: cat.affectionLevel?.toDouble() ?? 0.0,
                    ),
                    ScoreWidget(
                      label: "Child friendly",
                      score: cat.childFriendly?.toDouble() ?? 0.0,
                    ),
                    ScoreWidget(
                      label: "Dog friendly",
                      score: cat.dogFriendly?.toDouble() ?? 0.0,
                    ),
                    ScoreWidget(
                      label: "Stranger friendly",
                      score: cat.strangerFriendly?.toDouble() ?? 0.0,
                    ),
                    const DividerWidget(),

                    /// Personality section
                    ScoreWidget(
                      label: "Intelligence",
                      score: cat.intelligence?.toDouble() ?? 0.0,
                    ),
                    ScoreWidget(
                      label: "Energy level",
                      score: cat.energyLevel?.toDouble() ?? 0.0,
                    ),
                    ScoreWidget(
                      label: "Adaptability",
                      score: cat.adaptability?.toDouble() ?? 0.0,
                    ),
                    ScoreWidget(
                      label: "Indoor",
                      score: cat.indoor?.toDouble() ?? 0.0,
                    ),
                    const DividerWidget(),

                    /// Physical section
                    ScoreWidget(
                      label: "Grooming",
                      score: cat.grooming?.toDouble() ?? 0.0,
                    ),
                    ScoreWidget(
                      label: "Shedding level",
                      score: cat.sheddingLevel?.toDouble() ?? 0.0,
                    ),
                    ScoreWidget(
                      label: "Healt issues",
                      score: cat.healthIssues?.toDouble() ?? 0.0,
                    ),
                    ScoreWidget(
                      label: "Hypoallergenic",
                      score: cat.hypoallergenic?.toDouble() ?? 0.0,
                    ),
                    ScoreWidget(
                      label: "Hairless",
                      score: cat.hairless?.toDouble() ?? 0.0,
                    ),
                    ScoreWidget(
                      label: "Short legs",
                      score: cat.shortLegs?.toDouble() ?? 0.0,
                    ),
                    ScoreWidget(
                      label: "Suppressed tail",
                      score: cat.suppressedTail?.toDouble() ?? 0.0,
                    ),
                    ScoreWidget(
                      label: "Vocalisation",
                      score: cat.vocalisation?.toDouble() ?? 0.0,
                    ),
                    ScoreWidget(
                      label: "Lap",
                      score: cat.lap?.toDouble() ?? 0.0,
                    ),
                    ScoreWidget(
                      label: "Rare",
                      score: cat.rare?.toDouble() ?? 0.0,
                    ),
                    ScoreWidget(
                      label: "Rex",
                      score: cat.rex?.toDouble() ?? 0.0,
                    ),
                    ScoreWidget(
                      label: "Experimental",
                      score: cat.experimental?.toDouble() ?? 0.0,
                    ),
                    ScoreWidget(
                      label: "Natural",
                      score: cat.natural?.toDouble() ?? 0.0,
                    ),
                    const DividerWidget(),
                  ],
                ),
                Container(
                  height: 16,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: AlignmentDirectional.topCenter,
                      end: AlignmentDirectional.bottomCenter,
                      colors: [
                        AppColors.backgroundColor,
                        AppColors.backgroundColor.withOpacity(0),
                      ],
                    ),
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
