import 'package:flutter/material.dart';
import 'api_model.dart';

class PostListScreen extends StatelessWidget {
  final int userId;

  PostListScreen({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: FutureBuilder(
        future: ApiService().getPosts(userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Post> posts = snapshot.data ?? [];
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                Post post = posts[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.body),
                    onTap: () {
                      // Handle post tap if needed
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
