// ignore_for_file: library_private_types_in_public_api

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:untitled/apps/instagram/pages/widgets/mock_users.dart';
import 'package:untitled/apps/instagram/utils/colors.dart';
import 'dart:math' as math;

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    var random = math.Random();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < 30; i++) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              children: [
                FollowAccount(
                  iconUrl: iconImages[random.nextInt(iconImages.length)],
                  isStorys: random.nextBool(),
                ),
                const Gap(24),
                Text(
                  userName[random.nextInt(userName.length)],
                  style: const TextStyle(
                    color: InstagramColor.primaryBlack,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          const Gap(8),
          SimpleCarousel(
            pages: [
              for (int n = 0; n < postImages.length; n++)
                PostImages(
                  postImage: postImages[n],
                ),
            ],
          ),
          PostOptions(
            likeNum: random.nextInt(3000),
            sendNum: random.nextInt(400),
          ),
          Comments(likeAccount: userName[random.nextInt(iconImages.length)]),
          const Gap(14),
        ],
      ],
    );
  }
}

class FollowAccount extends StatelessWidget {
  final String iconUrl;
  final bool isStorys;
  const FollowAccount({
    super.key,
    required this.iconUrl,
    required this.isStorys,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        gradient: isStorys
            ? const LinearGradient(colors: [
                InstagramColor.primaryWhite,
                InstagramColor.primaryWhite,
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
          width: 48, // `84 - (padding * 2)` に調整
          height: 48,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class PostImages extends StatelessWidget {
  final String postImage;
  const PostImages({
    super.key,
    required this.postImage,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: postImage,
    );
  }
}

class PostOptions extends StatelessWidget {
  final int likeNum;
  final int sendNum;
  const PostOptions({
    super.key,
    required this.likeNum,
    required this.sendNum,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            iconSize: 42,
            icon: const Icon(
              Icons.favorite_border,
            ),
          ),
          Text('$likeNum'),
          const Gap(8),
          IconButton(
            onPressed: () {},
            iconSize: 42,
            icon: const Icon(
              Icons.chat_bubble_outline,
            ),
          ),
          const Gap(8),
          IconButton(
            onPressed: () {},
            iconSize: 42,
            icon: const Icon(
              Icons.send_outlined,
            ),
          ),
          Text('$sendNum'),
          const Spacer(),
          IconButton(
            onPressed: () {},
            iconSize: 42,
            icon: const Icon(
              Icons.bookmark_outline,
            ),
          ),
        ],
      ),
    );
  }
}

class Comments extends StatelessWidget {
  final String likeAccount;
  const Comments({super.key, required this.likeAccount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$likeAccount 他がいいねしました'),
          CommentText(text: 'コメント' * 15),
        ],
      ),
    );
  }
}

class CommentText extends StatelessWidget {
  final String text;
  final int maxLines;

  const CommentText({
    super.key,
    required this.text,
    this.maxLines = 2, // 最大2行まで表示
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final textPainter = TextPainter(
          text: TextSpan(text: text, style: const TextStyle(fontSize: 16)),
          maxLines: maxLines,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        final isOverflow = textPainter.didExceedMaxLines; // 2行超えたか判定

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 左端に配置
          children: [
            Text(
              text,
              maxLines: isOverflow ? maxLines : null, // 省略あり or 全文
              overflow: isOverflow ? TextOverflow.ellipsis : null,
              style: const TextStyle(fontSize: 16),
            ),
            if (isOverflow) // 2行超えていたらボタン表示
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'さらに表示',
                    style: TextStyle(
                        color: InstagramColor.primaryBlack,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class SimpleCarousel extends StatefulWidget {
  final List<Widget> pages;

  const SimpleCarousel({super.key, required this.pages});

  @override
  _SimpleCarouselState createState() => _SimpleCarouselState();
}

class _SimpleCarouselState extends State<SimpleCarousel> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 340, // カルーセルの高さ
          child: PageView(
            controller: _controller,
            children: widget.pages,
          ),
        ),
        const SizedBox(height: 8),
        _buildIndicator(),
      ],
    );
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.pages.length, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == _currentPage
                ? Colors.blue
                : Colors.grey, // アクティブページの色を変更
          ),
        );
      }),
    );
  }
}
