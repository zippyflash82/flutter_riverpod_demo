import 'package:flutter_riverpod_demo/repository/repository.dart';
// ignore: depend_on_referenced_packages
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/models/post.dart';

part 'posts.g.dart';

@riverpod
class Posts extends _$Posts {
  final repository = RepositoryImp();
  @override
  Future<List<PostModel>> build() async {
    return await repository.fetchPosts();
  }
  // Function To Refresh The State of PostsProvider
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => repository.fetchPosts());
  }
}
