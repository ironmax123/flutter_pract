import 'package:flutter/material.dart';
import 'package:untitled/gen/assets.gen.dart';

class InstagramAppbar extends StatelessWidget {
  const InstagramAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Assets.logo.instagramLogoSvg.image(
          width: 150.0,
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          iconSize: 48,
          icon: const Icon(Icons.favorite_outline),
        ),
        IconButton(
          onPressed: () {},
          iconSize: 48,
          icon: const Icon(Icons.chat_bubble_outline),
        ),
      ],
    );
  }
}
