import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeroWelcome extends StatelessWidget {
  const HeroWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(16, 64, 16, 0),
      alignment: Alignment.centerLeft,
      child: Text(
        'welcome_headline'.tr,
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
      ),
    );
  }
}
