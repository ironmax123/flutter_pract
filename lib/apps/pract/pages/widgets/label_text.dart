import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:untitled/apps/pract/pages/widgets/element.dart';
import 'package:untitled/apps/pract/utils/color.dart';

class LabelText extends StatelessWidget {
  const LabelText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 78,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black.withOpacity(0.35),
        border: Border.all(
          color: Colors.white, // ボーダーの色
          width: 2, // ボーダーの太さ
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserIcon(
              imageUrl:
                  'https://dy2bii70nf3dy.cloudfront.net/build/img/photobook/tips/contents29_1.png',
            ),
            TextElement(
              title: 'Ivy Johnson',
              subTitle: 'ああああああああ',
              titleColor: Colors.white,
              subTitleColor: Colors.white,
            ),
            Spacer(),
            IconButtons(),
          ],
        ),
      ),
    );
  }
}

class IconButtons extends StatelessWidget {
  const IconButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(30), // 押したときのエフェクト範囲
            child: Container(
              padding: const EdgeInsets.all(8), // アイコンと背景の余白
              decoration: BoxDecoration(
                color: ColorPract.whiteGrey.withOpacity(0.5),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white, // ボーダーの色
                  width: 2, // ボーダーの太さ
                ),
              ),
              child: const Icon(Icons.share),
            ),
          ),
          const Gap(6),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(30), // 押したときのエフェクト範囲
            child: Container(
              padding: const EdgeInsets.all(8), // アイコンと背景の余白
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.7),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white, // ボーダーの色
                  width: 2, // ボーダーの太さ
                ),
              ),
              child: const Icon(Icons.logout),
            ),
          )
        ],
      ),
    );
  }
}

class UserIcon extends StatelessWidget {
  final String imageUrl;
  const UserIcon({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: ColorPract.white,
          border: Border.all(
            color: Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(256), // 枠の角を丸める
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(256), // 画像を丸く
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            width: 48,
            height: 48,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
