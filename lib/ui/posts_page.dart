import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/ui/widgets/loading_view.dart';
import 'package:flutter_riverpod_demo/ui/widgets/post_view.dart';
import 'package:flutter_riverpod_demo/ui/widgets/posts_loading_error_view.dart';
import '../providers/posts.dart';

class PostsPage extends ConsumerWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsyncValue = ref.watch(postsProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await ref.read(postsProvider.notifier).refresh();
          },
          child: postsAsyncValue.when(
              data: (posts) {
                return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return PostView(post: post);
                  },
                );
              },
              loading: () => LoadingView(),
              error: (error, stack) => PostsLoadingErrorView(error: error)),
        ),
      ),
    );
  }
}
