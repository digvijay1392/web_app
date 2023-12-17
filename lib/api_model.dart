// api_models.dart
import 'package:http/http.dart' as http;
import 'dart:convert';
class User {
  final int id;
  final String name;
  // Add other user properties

  User({required this.id, required this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      // Add other user properties
    );
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;
  // Add other post properties

  Post({required this.userId, required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
      // Add other post properties
    );
  }
}

// Create similar classes for Todo, Album, and Photo

class ApiService {
  final String baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));
    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body);
      return jsonResponse.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<List<Post>> getPosts(int userId) async {
    final response = await http.get(Uri.parse('$baseUrl/users/$userId/posts'));
    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body);
      return jsonResponse.map((post) => Post.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

// Create similar methods for getTodos, getAlbums, and getPhotos
}
