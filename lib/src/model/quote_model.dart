// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class QuotesModel {
   String q;
   String a;
   String? c;
   String? h;

  QuotesModel({
    required this.q,
    required this.a,
    this.c,
    this.h,
  });

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'q': q,
      'a': a,
      'c': c,
      'h': h,
    };
  }

  factory QuotesModel.fromMap(Map<String, dynamic> map) {
    return QuotesModel(
      q: map['q'] as String,
      a: map['a'] as String,
      c: map['c'] != null ? map['c'] as String : null,
      h: map['h'] != null ? map['h'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuotesModel.fromJson(String source) => QuotesModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
