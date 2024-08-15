import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  List users = [];
  int currentPage = 1;
  bool isLoading = false;
  bool hasMoreData = true;

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    if (!hasMoreData || isLoading) return;
    setState(() {
      isLoading = true;
    });
    final response = await http.get(Uri.parse('https://reqres.in/api/users?page=$currentPage'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        users.addAll(data['data']);
        currentPage++;
        if (data['data'].length == 0) {
          hasMoreData = false;
        }
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Third Screen")),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            users.clear();
            currentPage = 1;
            hasMoreData = true;
          });
          await fetchUsers();
        },
        child: ListView.builder(
          itemCount: users.length + (hasMoreData ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == users.length) {
              fetchUsers();
              return Center(child: CircularProgressIndicator());
            }
            final user = users[index];
            return ListTile(
              title: Text("${user['first_name']} ${user['last_name']}"),
              subtitle: Text(user['email']),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(user['avatar']),
              ),
              onTap: () {
                Navigator.pop(context, "${user['first_name']} ${user['last_name']}");
              },
            );
          },
        ),
      ),
    );
  }
}