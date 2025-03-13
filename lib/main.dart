import 'package:flutter/material.dart';

import 'apps/instagram/main.dart' as InstagramApp;
import 'apps/apple_music/main.dart' as AppleMusic;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const SelectPage(),
    );
  }
}

class SelectPage extends StatelessWidget {
  const SelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => InstagramApp.main(),
            child: const Text('instagram'),
          ),
          ElevatedButton(
            onPressed: () => AppleMusic.main(),
            child: const Text('Apple Music'),
          ),
        ],
      ),
    );
  }
}
