import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webtoong/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon(
      {super.key, required this.title, required this.thumb, required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                title: title,
                thumb: thumb,
                id: id,
              ),
            ));
      },
      child: Row(
        children: [
          Hero(
            //Hero widget is used to animate the transition between the two screens
            //The animation is floating the image from the first screen to the second screen
            tag: id,
            child: Container(
              //Webtoon image container
              width: 100,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: const Offset(1, 2),
                    ),
                  ]),
              child: Image.network(
                //Webtoon image
                thumb,
                headers: const {
                  'Referer': 'https://comic.naver.com',
                },
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
