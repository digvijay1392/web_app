// models.dart
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
