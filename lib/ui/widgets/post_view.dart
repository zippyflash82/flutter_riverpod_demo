import 'package:flutter/material.dart';
import 'package:flutter_riverpod_demo/data/models/post.dart';

class PostView extends StatelessWidget {
  const PostView({super.key, required this.post});
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      child: ListTile(
        trailing: Icon(Icons.arrow_forward_ios),
        title: Text(
          post.title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        subtitle: Text(post.body),
      ),
    );
  }
}
