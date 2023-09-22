
import 'dart:convert';
import 'package:http/http.dart'as http;

import 'data.dart';
class ApiService {
  final baseUrl = 'https://reqres.in';

  Future<List<User>> fetchUsers(int page) async {
    final response = await http.get(Uri.parse('$baseUrl/api/users?page=$page'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<User> users = (data['data'] as List)
          .map((userData) => User(
        id: userData['id'],
        firstName: userData['first_name'],
        lastName: userData['last_name'],
        email: userData['email'],
        avatar: userData['avatar'],
      ))
          .toList();
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }
}