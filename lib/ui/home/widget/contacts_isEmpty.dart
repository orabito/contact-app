import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../style/reusable_components/TextStylesManager.dart';
import '../../../style/reusable_components/assets_manager.dart';

class ContactsIsEmpty extends StatelessWidget {
  const ContactsIsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Lottie.asset(
               AssetsManager.animation)),
      Text(
          "There is No Contacts Added Here",
          style:TextStylesManager.style,
        )
      ],
    );
  }
}
