import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PickUpWidgets extends StatelessWidget {
  const PickUpWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'あなたへのピックアップ',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 340,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Row(
                  children: [
                    const PickUpCard(
                      title: 'あなたにおすすめ',
                      playList: Recommendation(),
                    ),
                    const PickUpCard(
                      title: 'ニューリリース',
                      playList: PickUpAlbums(
                          imageUrl:
                              'https://yg-babymonster-official.jp/wp/wp-content/uploads/2024/10/DRIP_digital-cover.webp',
                          artist: 'BABYMONSTER',
                          albumName: 'DRIP',
                          bottomColor: Colors.purple),
                    ),
                    PickUpCard(
                      title: 'radio',
                      playList: PickUpAlbums(
                          imageUrl:
                              'https://aop-emtg-jp.s3.amazonaws.com/prod/public/mga/contents/information/37ebd743320220005d2bec22565626de.png',
                          artist: 'AppleMusic',
                          albumName: 'J-Pop Now Radio',
                          bottomColor: Colors.pink[100] ?? Colors.pink),
                    ),
                    PickUpCard(
                      title: 'RADWINPSをフィーチャー',
                      playList: PickUpAlbums(
                          imageUrl:
                              'https://www.s-company.jp/wp_2017/wp-content/uploads/2020/11/image001_.png',
                          artist: 'J-Pop Now Radio',
                          albumName: 'RADWINPSインタビュー',
                          bottomColor: Colors.lightGreen[300] ?? Colors.green),
                    ),
                    const PickUpCard(
                      title: 'ニューリリース',
                      playList: PickUpAlbums(
                          imageUrl:
                              'https://yg-babymonster-official.jp/wp/wp-content/uploads/2024/10/DRIP_digital-cover.webp',
                          artist: 'BABYMONSTER',
                          albumName: 'DRIP',
                          bottomColor: Colors.purple),
                    ),
                    const PickUpCard(
                      title: 'あなたにおすすめ',
                      playList: Station(),
                    ),
                    const PickUpCard(
                      title: 'ニューリリース',
                      playList: PickUpAlbums(
                          imageUrl:
                              'https://www.nme.com/wp-content/uploads/2025/01/Lady-Gaga-Mayhem-album-artwork.-Credit-PRESS.jpg',
                          artist: 'レディー・ガガ',
                          albumName: 'MAYHEM',
                          bottomColor: Colors.grey),
                    ),
                    PickUpCard(
                      title: 'JENNIEをフィーチャー',
                      playList: PickUpAlbums(
                          imageUrl:
                              'https://is1-ssl.mzstatic.com/image/thumb/Features211/v4/87/2d/28/872d28bb-e42b-9345-a581-86ac2cf98ac1/555c54d0-1c71-4a79-984f-68439f9ea1c2.png/632x632sr.webp',
                          artist: '',
                          albumName: 'JENNIE:The ZaneLowe InterView',
                          bottomColor: Colors.red[900] ?? Colors.red),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PickUpCard extends StatelessWidget {
  final String title;
  final Widget playList;
  const PickUpCard({
    super.key,
    required this.title,
    required this.playList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.grey),
        ),
        playList,
      ],
    );
  }
}

class Recommendation extends StatelessWidget {
  const Recommendation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10),
            ),
            width: 220,
            height: 270,
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              'Heavy\nRotation\nMix',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 64,
              decoration: BoxDecoration(
                color: Colors.yellow[900],
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: const Text(
                'BLACKPINK、BABYMONSTER、Mr.Children、milet、...',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Station extends StatelessWidget {
  const Station({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.pink[300],
              borderRadius: BorderRadius.circular(10),
            ),
            width: 220,
            height: 270,
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(8.0),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 64,
              decoration: BoxDecoration(
                color: Colors.red[600],
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: const Center(
                child: Text(
                  'Eitaさんのおすすめ',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PickUpAlbums extends StatelessWidget {
  final String imageUrl;
  final String artist;
  final String albumName;
  final Color bottomColor;
  const PickUpAlbums({
    super.key,
    required this.imageUrl,
    required this.artist,
    required this.albumName,
    required this.bottomColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            width: 220,
            height: 270,
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(8.0),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 64,
              decoration: BoxDecoration(
                color: bottomColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    albumName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    artist,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
