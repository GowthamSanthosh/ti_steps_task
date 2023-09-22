

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocks/internet_bloc/internet_bloc.dart';
import 'blocks/internet_bloc/internet_state.dart';
import 'data.dart';
import 'list.dart';

class UserListItem extends StatelessWidget {
  final User user;

  UserListItem({required this.user});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
          child: BlocConsumer<InternetBloc,InternetState>( listener:(context,state) {
            if(state is InternetGainedState){

            }
            else if(state is InternetLostState){
              ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text('Internet not connected!'),
                backgroundColor: Colors.red,));
            }
          },builder:(context,state){
            if(state is InternetGainedState){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => UserDetailPage(user: user),
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                        elevation: 30,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ], // Shadow
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.red, Colors.yellowAccent], // Define your gradient colors
                            ),
                          ),
                          height: 100,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage(user.avatar),
                              ),
                              const SizedBox(width: 20,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text('${user.firstName} ${user.lastName}',
                                        style: const TextStyle(fontSize:20,fontWeight: FontWeight.bold,
                                            fontFamily: "FontMain"),),
                                    ],
                                  ),
                                  const SizedBox(height: 8,),

                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
            else if(state is InternetLostState){
              return  Text('Not connected');
            }
            else{
              return  Text('Loading....');
            }
          },),
        ));
  }
}