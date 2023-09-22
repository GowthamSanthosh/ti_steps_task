

import 'package:flutter/material.dart';

import 'data.dart';


class UserDetailPage extends StatelessWidget {
  final User user;

  UserDetailPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue, Colors.green],
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        toolbarHeight: 200,
        title: Text('${user.firstName}${user.lastName}',style: const TextStyle(fontSize: 30,color: Colors.black,
            fontFamily: "SFPro"),)
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.blue,
                    shadows: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 5.0,
                        offset: const Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                  child: Image.network(user.avatar,fit: BoxFit.cover,),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
              elevation: 40,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text('Name: ${user.firstName} ${user.lastName}',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
                              fontFamily: "FontMain"),),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Email: ${user.email}',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
                            fontFamily: "FontMain"),)
                        ],
                      )
                    ],
                  ),
                ),
              ),)
            // Add more user details here
          ],
        ),
      ),
    );
  }
}