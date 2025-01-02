 import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../style/reusable_components/assets_manager.dart';
import '../../../style/reusable_components/colors_manager.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(120),
      child: AppBar(
        backgroundColor: ColorsManager.primary,
        leading: Padding(
          padding: const EdgeInsets.only(left: 26, top: 24),
          child: SvgPicture.asset(AssetsManager.leading, fit: BoxFit.contain),
        ),
        leadingWidth: 120,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(120);
}
