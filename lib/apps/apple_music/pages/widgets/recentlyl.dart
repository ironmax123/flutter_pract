import 'package:flutter/material.dart';
import 'package:untitled/apps/apple_music/pages/widgets/album.dart';

class Recently extends StatelessWidget {
  const Recently({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                '最近の再生',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                ),
              )
            ],
          ),
          SizedBox(
            height: 340,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                Row(
                  children: [
                    Albums(
                      title: 'DRIP',
                      artist: 'BABYMONSTER',
                      imageUrl:
                          'https://yg-babymonster-official.jp/wp/wp-content/uploads/2024/10/DRIP_digital-cover.webp',
                    ),
                    Albums(
                      title: 'Dream Come True',
                      artist: 'aespa',
                      imageUrl:
                          'https://static.wixstatic.com/media/50ad08_6930660d581e4324a302a6e0c2380684~mv2.jpg/v1/fill/w_482,h_482,al_c,q_80,usm_0.66_1.00_0.01,enc_avif,quality_auto/UICV-9267_TLw_extralarge.jpg',
                    ),
                    Albums(
                      title: 'BLACKPINK',
                      artist: '',
                      imageUrl:
                          'https://is1-ssl.mzstatic.com/image/thumb/Music112/v4/91/31/36/91313698-9306-c1a5-5b9c-d429b3d0800d/pr_source.png/632x632AM.RSAB02.webp',
                    ),
                    Albums(
                      title: "Life's Too Short",
                      artist: 'aespa',
                      imageUrl:
                          'https://aespa-official.jp/aspect/wp-content/uploads/2022/06/lifes-too-short.jpg',
                    ),
                    Albums(
                      title: 'お気に入り',
                      artist: '',
                      imageUrl:
                          'https://tshqyusauselogqjoehd.supabase.co/storage/v1/object/public/test/uploads/2025-03-13T13:03:00.006720.png',
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
