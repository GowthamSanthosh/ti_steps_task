import 'package:flutter/material.dart';

import 'api_data.dart';
import 'data.dart';
import 'list_data.dart';

class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  final _apiService = ApiService();
  final _scrollController = ScrollController();
  final _users = <User>[];
  int _page = 1;
  int currentPage = 1;
  int totalPages = 2; // Initially set to 1, or any other default value
  List<String> items = [];


  @override
  void initState() {
    super.initState();
    _loadUsers();
    _scrollController.addListener(_onScroll);
    loadData();
  }

  void _loadUsers() async {
    final users = await _apiService.fetchUsers(_page);
    setState(() {
      _users.addAll(users);
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      setState(() {
        _page++; // Load the next page of users
      });
      _loadUsers();
    }
  }
  Future<void> loadData() async {
    if (currentPage <= totalPages) {
      await Future.delayed(Duration(seconds: 2));
      List<String> moreItems = List.generate(20, (index) => 'Item ${items.length + index}');
      totalPages = 2;
      setState(() {
        items.addAll(moreItems);
        currentPage++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
        controller: _scrollController,
        itemCount: _users.length,
        itemBuilder: (context, index) {
          final user = _users[index];
          return UserListItem(user: user);
        },
      ),
    );
  }
}
