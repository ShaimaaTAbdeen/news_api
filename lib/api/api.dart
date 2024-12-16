import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsproj/model/news_response.dart';
import 'package:newsproj/model/source_response.dart';

class API{
static String baseURL="newsapi.org";
static String apiKey="96d76a7db4e44e8489228c12771d0e93";
static Future<SourceResponse> getSources() async
{
  //https://newsapi.org/v2/top-headlines/sources?apiKey=96d76a7db4e44e8489228c12771d0e93
  Uri url = Uri.https(baseURL,'/v2/top-headlines/sources',
  {"apiKey":apiKey});
  var response = await http.get(url);
  var bodyResponse =response.body;
  var json = jsonDecode(bodyResponse);
  return SourceResponse.fromJson(json);
}
static Future<NewsResponse> getNews ()async
{
  //https://newsapi.org/v2/everything?q=bitcoin&apiKey=96d76a7db4e44e8489228c12771d0e93
  Uri url = Uri.https(baseURL,'/v2/everything',{"q":"bitcoin","apiKey":apiKey});
  var response = await http.get(url);
  var bodyResponse =response.body;
  var json = jsonDecode(bodyResponse);
  return NewsResponse.fromJson(json);
}
}