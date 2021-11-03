import 'package:coco_search/components/custom_input.dart';
import 'package:coco_search/components/custom_text_button.dart';
import 'package:coco_search/core/colors.dart';
import 'package:coco_search/core/styles.dart';
import 'package:coco_search/infrastructure/models/super_category.dart';

import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  SearchBar(
      {Key? key, required this.selectedCategories, required this.onSearch})
      : super(key: key);
  List<SuperCategory> selectedCategories;
  Function() onSearch;
  final TextEditingController searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: CustomColors.grey)),
            child: Row(
              children: [
                Expanded(
                  child: CustomInput(
                    controller: searchTextController,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        SizedBox(
          width: 100,
          child: CustomTextButton(
              color: CustomColors.blue,
              child: const Text(
                'Search',
                style: kTextStyle18,
              ),
              onPressed: () {
                onSearch();
              }),
        )
      ],
    );
  }
}
