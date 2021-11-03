import 'package:coco_search/core/colors.dart';
import 'package:coco_search/infrastructure/states/search_state.dart';
import 'package:coco_search/routes.dart';
import 'package:coco_search/screens/search/view/result_page.dart';
import 'package:coco_search/screens/search/view/search_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<SearchState>(
            create: (context) => SearchState(),
            lazy: false,
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          onGenerateRoute: RouteGenerator.generateRoute,
          initialRoute: ResultPage.resultRouteName,
          theme: ThemeData(
            backgroundColor: CustomColors.white,
            scaffoldBackgroundColor: CustomColors.white,
            primarySwatch: Colors.blue,
          ),
          home: ResultPage(),
        ),
      );
    });
  }
}
