import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webtoong/models/webtoon_model.dart';
import 'package:webtoong/services/api_service.dart';
import 'package:webtoong/widget/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Future<List<WebtoonModel>> webtoonList = ApiService.getTodayWebtoons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xffF4A5AE),
        title: const Text(
          'WebToong',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
      ),
      body: FutureBuilder(
        future: webtoonList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Expanded(child: makeList(snapshot)),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xffF4A5AE),
            ),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      scrollDirection: Axis.vertical,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        //ListView builder that triggers when the user is viewing

        final webtoon = snapshot.data![index];
        return Webtoon(
            title: webtoon.title, thumb: webtoon.thumb, id: webtoon.id);
      },
      separatorBuilder: (context, index) => const SizedBox(
        //add SizedBox as a separator
        height: 20,
      ),
    );
  }
}
