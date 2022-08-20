import 'package:flutter/material.dart';
import 'package:product_catalog_screen/http_services.dart';

import 'post_model.dart';

class PostsPage extends StatelessWidget {
  PostsPage({Key? key}) : super(key: key);

  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: httpService.getPosts(),
      builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
        if (snapshot.hasData) {
          List<Post> posts = snapshot.data!;
          return ListView(
            children: posts
                .map(
                  (Post post) => ListTile(
                    title: Text(post.product),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(post.barcode),
                        Text("${post.wholeSaleQuant}"),
                      ],
                    ),
                  ),
                )
                .toList(),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
