import 'package:flutter/material.dart';
import 'package:untitled/apps/instagram/pages/widgets/post.dart';
import 'package:untitled/apps/instagram/pages/widgets/storys.dart';
import 'package:untitled/gen/assets.gen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Assets.logo.instagramLogoSvg.image(
            width: 150.0,
          ),
          actions: [
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
        ),
        body: ListView(
          children: const [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StorysWidgets(),
                PostCard(),
              ],
            ),
          ],
        ));
  }
}
