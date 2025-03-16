import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:untitled/apps/pract/pages/widgets/element.dart';
import 'package:untitled/apps/pract/utils/color.dart';

class NowPlay extends StatelessWidget {
  const NowPlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'なうぷれ',
          style: TextStyle(
            color: ColorPract.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 128,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white.withOpacity(0.35),
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
                AlbumImage(
                  imageUrl:
                      'https://static.wixstatic.com/media/50ad08_6930660d581e4324a302a6e0c2380684~mv2.jpg/v1/fill/w_482,h_482,al_c,q_80,usm_0.66_1.00_0.01,enc_avif,quality_auto/UICV-9267_TLw_extralarge.jpg',
                ),
                Gap(20),
                Center(
                  child: TextElement(
                    title: "Life's Too Short (English ver)",
                    subTitle: 'aespa',
                    isMarquee: true,
                  ),
                ),
                IconButtons(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AlbumImage extends StatelessWidget {
  final String imageUrl;
  const AlbumImage({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 108,
        height: 108,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover, // 小さい画像を拡大して枠いっぱいにする
          ),
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
      child: InkWell(
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
    );
  }
}
