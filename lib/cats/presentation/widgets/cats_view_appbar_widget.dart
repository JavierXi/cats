import 'package:cats/utils/colors.dart';
import 'package:cats/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:cats/utils/size.dart';

class CatsViewAppbarWidget extends StatelessWidget {
  final TextEditingController searchController;
  final Function onPressClearIcon;
  final Function(String) onChangeTextField;
  const CatsViewAppbarWidget({
    super.key,
    required this.searchController,
    required this.onPressClearIcon,
    required this.onChangeTextField,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      titleSpacing: 16,
      centerTitle: true,
      toolbarHeight: 130,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.backgroundColor,
      title: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Cat breeds",
            style: AppStyles.title,
          ),
          Container(
            height: 55,
            width: AppSize.screenSize(context).width,
            margin: const EdgeInsets.only(top: 16),
            padding: const EdgeInsets.only(left: 16),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.textColor,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              maxLines: 1,
              style: AppStyles.subtitleLarge,
              keyboardType: TextInputType.name,
              controller: searchController,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search...",
                hintStyle: AppStyles.hint,
                suffixIcon: IconButton(
                  onPressed: () => onPressClearIcon(),
                  icon: Icon(
                    Icons.close_rounded,
                    color: AppColors.textColor,
                  ),
                  padding: const EdgeInsets.all(0),
                ),
              ),
              onChanged: (value) => onChangeTextField(value),
            ),
          ),
        ],
      ),
    );
  }
}
