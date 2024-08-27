import 'package:cats/cats/presentation/widgets/no_matches_found_widget.dart';
import 'package:cats/cats/presentation/widgets/cats_view_appbar_widget.dart';
import 'package:cats/cats/presentation/controllers/cats_controller.dart';
import 'package:cats/cats/presentation/widgets/cat_card_widget.dart';
import 'package:cats/cats/presentation/widgets/loading_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:cats/utils/routes.dart';
import 'package:provider/provider.dart';
import 'package:cats/utils/colors.dart';
import 'package:flutter/material.dart';

class CatsView extends StatefulWidget {
  const CatsView({super.key});

  @override
  State<CatsView> createState() => _CatsViewState();
}

class _CatsViewState extends State<CatsView> {
  @override
  void initState() {
    super.initState();
    CatsController controller = Provider.of<CatsController>(context, listen: false);
    controller.getAllCatBreeds();
  }

  @override
  Widget build(BuildContext context) {
    CatsController controller =
        Provider.of<CatsController>(context, listen: true);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(130),
          child: CatsViewAppbarWidget(
            searchController: controller.searhController,
            onPressClearIcon: () => controller.clearQuery(),
            onChangeTextField: (value) => controller.filterCats(value),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: controller.allCatBreeds.isEmpty
                  ? const LoadingWidget()
                  : controller.filteredCatBreeds.isEmpty
                      ? const NoMatchesFoundWidget()
                      : ListView.builder(
                          itemCount: controller.filteredCatBreeds.length,
                          itemBuilder: (context, index) {
                            return CatCardWidget(
                              cat: controller.filteredCatBreeds[index],
                              onTap: () => context.push(
                                AppRoutes.catDetailView,
                                extra: controller.filteredCatBreeds[index],
                              ),
                              function: controller.getCatImageUrl(
                                  catReferenceId: controller
                                          .filteredCatBreeds[index]
                                          .referenceImageId ??
                                      ""),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
