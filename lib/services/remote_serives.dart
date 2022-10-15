import 'dart:convert';

import '../models/post.dart';
import 'package:http/http.dart' as http;

class RemoteSerives{
  Future<dynamic> getPosts(String api) async{
    var client=http.Client();

    var uri=Uri.parse("https://tusharkumarr.github.io/examplepostapi/temp.json");
    var response=await client.get(uri);

    if(response.statusCode==200){
      var json=response.body;
      return postFromJson(json);
    }
  }


}