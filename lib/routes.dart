import 'package:coco_search/screens/search/view/result_page.dart';
import 'package:coco_search/screens/search/view/search_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case SearchScreen.searchRouteName:
        return MaterialPageRoute(
          builder: (_) => const SearchScreen(),
        );
      case ResultPage.resultRouteName:
        return MaterialPageRoute(
          builder: (_) => const ResultPage(),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
