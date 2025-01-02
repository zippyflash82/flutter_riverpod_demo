import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/posts.dart';

class PostsLoadingErrorView extends ConsumerWidget {
  const PostsLoadingErrorView({super.key, required this.error});
  final Object error;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          Text('Error: $error'),
          const SizedBox(height: 8),
          ElevatedButton.icon(
            onPressed: () {
              ref.read(postsProvider.notifier).refresh();
            },
            label: const Text('Retry'),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
