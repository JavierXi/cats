import 'package:cats/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:cats/utils/size.dart';

class NoMatchesFoundWidget extends StatelessWidget {
  const NoMatchesFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.screenSize(context).width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "No matches found",
            style: AppStyles.title,
          ),
        ],
      ),
    );
  }
}
