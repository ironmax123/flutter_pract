import 'package:flutter/material.dart';
import 'package:untitled/apps/apple_music/pages/widgets/pick_up.dart';
import 'package:untitled/apps/apple_music/pages/widgets/recentlyl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'ホーム',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {},
                color: Colors.red,
                icon: const Icon(Icons.cast),
              ),
              IconButton(
                onPressed: () {},
                color: Colors.red,
                icon: const Icon(Icons.more_vert),
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PickUpWidgets(),
              Recently(),
            ],
          ),
        ],
      ),
    );
  }
}
