import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:untitled/apps/pract/pages/wallet/page.dart';
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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 128),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: double.infinity),
              const LabelText(),
              const Gap(24),
              const NowPlay(),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WalletPage(),
                      ));
                },
                child: const Text('ウォレットテスト'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
