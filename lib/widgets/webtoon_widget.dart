import 'package:flutter/material.dart';
import 'package:toonix/screens/detail.screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    //! GestureDetector는 대부분의 동작을 감지해준다.
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          // 방법1
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              title: title,
              thumb: thumb,
              id: id,
            ),
            fullscreenDialog: true,
          ),
          // 방법2
          // PageRouteBuilder(
          //   transitionsBuilder: (context, animation, secondaryAnimation, child) {
          //     var begin = const Offset(0, 1.0);
          //     var end = Offset.zero;
          //     var curve = Curves.ease;
          //     var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          //     return SlideTransition(
          //       position: animation.drive(tween),
          //       child: child,
          //     );
          //   },
          //   pageBuilder: (context, anmation, secondaryAnimation) =>
          //       DetailScreen(id: id, title: title, thumb: thumb),
          // ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: id,
            child: Container(
              width: 250,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 7,
                    offset: const Offset(7, 7),
                    color: Colors.black.withOpacity(0.5),
                  ),
                ],
              ),
              child: Image.network(
                thumb,
                headers: const {
                  "User-Agent":
                      "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
