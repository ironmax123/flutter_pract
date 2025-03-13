import 'package:flutter/material.dart';

class MusicTile extends StatelessWidget {
  final String title;
  final String albumTitle;
  final String artist;
  final String imageUrl;
  const MusicTile({
    super.key,
    required this.title,
    required this.albumTitle,
    required this.artist,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column();
  }
}
