import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/constants.dart';
import '../data/models/post.dart';
import 'package:http/http.dart' as http;

abstract class PostRepository {
  Future<List<PostModel>> fetchPosts();
}

class RepositoryImp implements PostRepository {
  @override
  Future<List<PostModel>> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/posts'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((post) => PostModel.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}

final repositoryProvider = Provider<RepositoryImp>((ref) {
  return RepositoryImp();
});
