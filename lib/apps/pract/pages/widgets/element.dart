import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:marquee/marquee.dart';

class TextElement extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool isMarquee;
  final Color titleColor;
  final Color subTitleColor;
  const TextElement({
    super.key,
    required this.title,
    required this.subTitle,
    this.isMarquee = false,
    this.titleColor = Colors.black,
    this.subTitleColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isMarquee
              ? SizedBox(
                  width: MediaQuery.of(context).size.width - 300,
                  height: 50, // Set a specific height
                  child: Marquee(
                    text: title,
                    style: TextStyle(
                      color: titleColor,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : Text(
                  title,
                  style: TextStyle(
                    color: titleColor,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          const Gap(4),
          Opacity(
            opacity: 0.5,
            child: Text(
              subTitle,
              style: TextStyle(
                color: subTitleColor,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
