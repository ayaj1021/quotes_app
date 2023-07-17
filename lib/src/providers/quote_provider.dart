import 'dart:convert';

import 'package:quotes_app/src/model/quote_model.dart';
import 'package:http/http.dart' as http;

class QuotesService {
  Future<QuotesModel> getQuotes() async {
    final uri = Uri.parse('https://zenquotes.io/api/quotes');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return QuotesModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Unable to load post');
    }
  }
}
