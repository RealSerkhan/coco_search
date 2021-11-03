import 'package:coco_search/core/colors.dart';
import 'package:coco_search/core/resources.dart';
import 'package:coco_search/core/styles.dart';
import 'package:coco_search/screens/search/view/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);
  static const resultRouteName = '/result';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: CustomColors.black,
          ),
          onPressed: () {},
        ),
        centerTitle: false,
        title: Text(
          'Coco Explore',
          style: kHeaderTextStyle18,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(SearchScreen.searchRouteName);
              },
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    border: Border.all(color: CustomColors.grey),
                    borderRadius: BorderRadius.circular(16)),
                child: Row(
                  children: [
                    SvgPicture.asset(Resource.search),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      'Search anything...',
                      style: kGreyTextStyle14,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
