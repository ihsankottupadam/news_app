import 'package:flutter/material.dart';
import 'package:news_app/app/data/models/news_model.dart';
import 'package:news_app/app/modules/home/controllers/home_controller.dart';
import 'package:news_app/app/widgets/news_tile.dart';

class SearchView extends SearchDelegate {
  final allNews = HomeController.instance.allNews;
  final categories = HomeController.instance.categories;

  @override
  String? get searchFieldLabel => 'Search News';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(
          Icons.clear,
        ),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<NewsModel> result = allNews
        .where((news) =>
            news.title.toLowerCase().contains(query.toLowerCase()) ||
            news.category == query.toLowerCase())
        .toList();

    if (query.isEmpty) {
      return _showCategories();
    }

    if (query.isNotEmpty && result.isEmpty) {
      return const Center(
        child: Text(
          'No Results Found',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20),
      itemCount: result.length,
      itemBuilder: (context, index) => NewsTile(news: result[index]),
    );
  }

  Widget _showCategories() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemCount: categories.length - 1,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(
            Icons.newspaper_sharp,
            color: Colors.red,
          ),
          title: Text(categories[index + 1]),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
          visualDensity: const VisualDensity(horizontal: 0, vertical: 0),
          onTap: () {
            query = categories[index + 1];
          },
        );
      },
    );
  }
}
