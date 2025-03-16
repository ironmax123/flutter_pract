import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:untitled/apps/pract/pages/widgets/label_text.dart';
import 'package:untitled/apps/pract/pages/widgets/now_play.dart';
import 'package:untitled/apps/pract/utils/gradient.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: GradientStyle.purpleGradient,
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 128),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: double.infinity),
              LabelText(),
              Gap(24),
              NowPlay(),
            ],
          ),
        ),
      ),
    );
  }
}
