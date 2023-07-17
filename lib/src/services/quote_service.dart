
import 'package:dio/dio.dart';

import 'package:quotes_app/src/model/quote_model.dart';


class QuoteService {
  Future<List<QuotesModel>> getQuotes() async {
    String endpoint = 'https://zenquotes.io/api/quotes/1';

    var dio = Dio();
    final response = await dio.get(endpoint);

    final result = List<Map<String, dynamic>>.from(response.data);

    List<QuotesModel> listQuotes =
        result.map((e) => QuotesModel.fromMap(e)).toList();

    return listQuotes;

    
  }
}
