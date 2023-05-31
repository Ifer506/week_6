import 'package:flutter/material.dart';

import '../di/di.dart';
import '../model/user.dart';
import '../repository/user_repository.dart';

class DisplayUserView extends StatefulWidget {
  const DisplayUserView({super.key});

  @override
  State<DisplayUserView> createState() => _DisplayUserViewState();
}

class _DisplayUserViewState extends State<DisplayUserView> {
  @override
  Widget build(BuildContext context) {
    List<User> users = getIt<UserRepository>().getUsers();
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Users"),
        centerTitle: true,
        elevation: 4,
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Container(
                color: Colors.blue,
                height: 150,
                width: double.infinity,
                child: Card(
                  child: Center(
                    child: Text(
                      " Id:  ${users[index].id} \n Name: ${users[index].fname} \n Date : ${users[index].date}  }",
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
