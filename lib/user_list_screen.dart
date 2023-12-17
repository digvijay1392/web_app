// user_list_screen.dart
import 'package:flutter/material.dart';
import 'api_service.dart'as apiService;
import 'post_list_screen.dart';
import 'api_model.dart';
class UserListScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: FutureBuilder<List<User>>(
        future: apiService.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || snapshot.data == null) {
            return Center(child: Text('Error: ${snapshot.error ?? "Failed to load users"}'));
          } else {
            List<User> users = snapshot.data ?? [];
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                User user = users[index];
                return ListTile(
                  title: Text(user.name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostListScreen(userId: user.id),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

