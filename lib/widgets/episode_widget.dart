import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Epsiode extends StatelessWidget {
  final String webtoonId, id, title, rating, date;

  const Epsiode({
    super.key,
    required this.webtoonId,
    required this.id,
    required this.title,
    required this.rating,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        //! trim() = 문자열에서 앞,뒤 공백을 지워줌 // isNotEmpty = 문자열이 있을때.
        if (id.trim().isNotEmpty) {
          final episodeId = int.parse(id) + 1;
          await launchUrlString(
              'https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=$episodeId');
        } else {
          await launchUrlString('https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=1');
        }
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.green.shade500,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const Icon(
                    Icons.chevron_right_rounded,
                    color: Colors.white,
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
