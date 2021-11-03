import 'package:coco_search/components/custom_appbar.dart';
import 'package:coco_search/components/custom_input.dart';
import 'package:coco_search/components/custom_text_button.dart';
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
  TextEditingController searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onTapLeading: () => Navigator.of(context).maybePop(),
      ),
      body: SafeArea(
        child: Consumer<SearchState>(builder: (context, searchState, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                    searchState.selectedSubCategories
                                        .removeWhere((element) =>
                                            element.id == superCategory.id);
                                  }
                                  setState(() {});
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      right: 8, bottom: 8),
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
                  getSearchbar(searchState, () {
                    searchState.search();
                  }),
                  getHints(searchTextController.text, searchState),
                  searchState.selectedSubCategories.isEmpty
                      ? const SizedBox.shrink()
                      : Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: Wrap(
                            alignment: WrapAlignment.start,
                            children: searchState.selectedSubCategories
                                .map((e) => Container(
                                      height: 45,
                                      padding: const EdgeInsets.only(left: 10),
                                      margin: const EdgeInsets.only(
                                          bottom: 8, right: 8),
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
            ),
          );
        }),
      ),
    );
  }

  getSearchbar(SearchState state, Function onSearch) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: CustomColors.grey)),
            child: Row(
              children: [
                Expanded(
                  child: CustomInput(
                    controller: searchTextController,
                    onChanged: (text) {
                      setState(() {});
                    },
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
              onPressed: () {}),
        )
      ],
    );
  }

  getHints(String text, SearchState state) {
    return text.isEmpty
        ? const SizedBox()
        : Container(
            margin: const EdgeInsets.only(top: 15),
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: R()
                  .catToId
                  .entries
                  .toList()
                  .where((subEntry) =>
                      subEntry.key.startsWith(text) &&
                      !state.selectedSubCategories
                          .map((e) => e.id)
                          .contains(subEntry.value))
                  .map((filteredCategory) => InkWell(
                        onTap: () {
                          state.selectedSubCategories.add(SuperCategory(
                              name: filteredCategory.key,
                              id: filteredCategory.value));
                          searchTextController.clear();
                          setState(() {});
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 8, bottom: 8),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: CustomColors.blue,
                              borderRadius: BorderRadius.circular(12)),
                          child: Text(
                            filteredCategory.key,
                            style: kTextStyle18,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          );
  }
}
