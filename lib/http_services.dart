import 'dart:convert';

import 'package:http/http.dart';
import 'package:product_catalog_screen/page.dart';

import 'post_model.dart';

class HttpService {
  final postsURL = "https://vprice-app.herokuapp.com/api/v1/products/";

  Future<List<Post>> getPosts() async {
    Response res = await get(Uri.parse(postsURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts = body
          .map(
            (dynamic item) => Post.fromJson(item),
          )
          .toList();

      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<List<Post>> postPosts() async {
    Response res = await post(Uri.parse(postsURL), body: formFields);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts = body
          .map(
            (dynamic item) => Post.fromJson(item),
          )
          .toList();

      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
