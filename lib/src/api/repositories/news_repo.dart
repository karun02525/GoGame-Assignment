

import 'package:gogame_app/src/api/model/news_model.dart';
import 'package:gogame_app/src/api/service/api_error_handle.dart';
import 'package:gogame_app/src/api/service/custom_dio.dart';

class NewsRepository{

  Future<List<Article>> findAllNews(String url) async {
    var dio =CustomDio.withAuthentication().instance;
    return await dio.get(url.trim()).then((res){
      if(res.statusCode==200) {
        return NewsModel.fromJson(res.data).articles;
      }
    }).catchError((e) {
        ApiErrorHandel.errorHandel(e);
    });
  }

}