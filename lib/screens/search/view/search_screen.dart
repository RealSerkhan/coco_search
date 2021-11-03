import 'package:coco_search/core/colors.dart';
import 'package:coco_search/core/r.dart';
import 'package:coco_search/core/styles.dart';
import 'package:coco_search/infrastructure/models/super_category.dart';
import 'package:coco_search/infrastructure/states/search_state.dart';

import 'package:coco_search/screens/search/widgets/search_bar.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const searchRouteName = '/search';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<SearchState>(builder: (context, searchState, child) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                    children: R()
                        .catToId
                        .entries
                        .map((e) => InkWell(
                              onTap: () {
                                var superCategory =
                                    SuperCategory(name: e.key, id: e.value);
                                if (!searchState.selectedSubCategories
                                    .map((e) => e.id)
                                    .contains(superCategory.id)) {
                                  searchState.selectedSubCategories
                                      .add(superCategory);
                                } else {
                                  searchState.selectedSubCategories.removeWhere(
                                      (element) =>
                                          element.id == superCategory.id);
                                }
                                setState(() {});
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.only(right: 8, bottom: 8),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: searchState.selectedSubCategories
                                            .map((e) => e.id)
                                            .contains(e.value)
                                        ? CustomColors.blue
                                        : CustomColors.grey,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Text(
                                  e.key,
                                  style: kTextStyle18,
                                ),
                              ),
                            ))
                        .toList()),
                SearchBar(
                  selectedCategories: searchState.selectedSubCategories,
                  onSearch: () {
                    searchState.search();
                  },
                ),
                searchState.selectedSubCategories.isEmpty
                    ? SizedBox.shrink()
                    : Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Wrap(
                          alignment: WrapAlignment.start,
                          children: searchState.selectedSubCategories
                              .map((e) => Container(
                                    height: 45,
                                    padding: const EdgeInsets.only(left: 10),
                                    margin:
                                        EdgeInsets.only(bottom: 8, right: 8),
                                    decoration: BoxDecoration(
                                      color: CustomColors.blue,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            e.name!,
                                            style: kTextStyle14,
                                          ),
                                          IconButton(
                                              padding: EdgeInsets.zero,
                                              color: CustomColors.white,
                                              onPressed: () {
                                                searchState
                                                    .selectedSubCategories
                                                    .remove(e);
                                                setState(() {});
                                              },
                                              icon: const Icon(Icons.clear))
                                        ]),
                                  ))
                              .toList(),
                        ),
                      ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
