import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:untitled/apps/instagram/pages/widgets/mock_users.dart';
import 'package:untitled/apps/instagram/utils/colors.dart';

class StorysWidgets extends StatelessWidget {
  const StorysWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    var random = math.Random();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const Column(
              children: [
                MyStorys(
                  iconUrl:
                      'https://tshqyusauselogqjoehd.supabase.co/storage/v1/object/public/avatar/avatar/2025-03-06T20:05:28.774864.png',
                ),
                Text(
                  'my_name',
                  style: TextStyle(
                    color: InstagramColor.primaryBlack,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const Gap(8),
            for (int i = 0; i < 10; i++) ...[
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: FollowAccount(
                      iconUrl: iconImages[random.nextInt(iconImages.length)],
                      isFroend: random.nextBool(),
                    ),
                  ),
                  Text(
                    userName[random.nextInt(userName.length)],
                    style: const TextStyle(
                      color: InstagramColor.primaryBlack,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ]
          ],
        ),
      ),
    );
  }
}

class MyStorys extends StatelessWidget {
  final String iconUrl;
  const MyStorys({
    super.key,
    required this.iconUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // アイコンを枠外に出すため
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(256),
          child: CachedNetworkImage(
            imageUrl: iconUrl,
            width: 72,
            height: 72,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: -2, // ちょっと外に出す
          bottom: -2,
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: InstagramColor.primaryBlack,
              shape: BoxShape.circle,
              border: Border.all(
                color: InstagramColor.primaryWhite,
                width: 5,
              ), // 外枠をつける
            ),
            child: const Icon(
              Icons.add,
              size: 14,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class FollowAccount extends StatelessWidget {
  final String iconUrl;
  final bool isFroend;
  const FollowAccount({
    super.key,
    required this.iconUrl,
    required this.isFroend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        gradient: isFroend
            ? const LinearGradient(colors: [
                InstagramColor.green,
                InstagramColor.green,
              ])
            : InstagramColor.instagramGradient,
        border: Border.all(
          color: Colors.transparent,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(256), // 枠の角を丸める
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(256), // 画像を丸く
        child: CachedNetworkImage(
          imageUrl: iconUrl,
          width: 74, // `84 - (padding * 2)` に調整
          height: 74,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
