import 'package:flutter/material.dart';
import 'package:untitled/apps/instagram/pages/widgets/appbar.dart';
import 'package:untitled/apps/instagram/pages/widgets/post.dart';
import 'package:untitled/apps/instagram/pages/widgets/storys.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: const [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InstagramAppbar(),
            StorysWidgets(),
            PostCard(),
          ],
        ),
      ],
    ));
  }
}
