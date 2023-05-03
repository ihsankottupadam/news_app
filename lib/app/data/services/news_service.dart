import 'package:dio/dio.dart';
import 'package:news_app/app/data/models/news_model.dart';
import 'package:news_app/core/values/api_constants.dart';

class NewsSwervice {
  Future<List<NewsModel>> getNews(String category) async {
    try {
      final response = await Dio()
          .get(ApiConstants.news, queryParameters: {'category': category});

      if (response.statusCode == 200) {
        return newsModelFromJson(response.data["data"]);
      } else {
        throw 'Something Went Wrong';
      }
    } catch (e) {
      throw 'Something Went Wrong';
    }
  }
}
