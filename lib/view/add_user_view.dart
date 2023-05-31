import 'package:flutter/material.dart';

import '../di/di.dart';
import '../model/user.dart';
import '../repository/user_repository.dart';

class AddUserView extends StatefulWidget {
  const AddUserView({super.key});

  @override
  State<AddUserView> createState() => _AddUserViewState();
}

class _AddUserViewState extends State<AddUserView> {
  DateTime dateTime = DateTime.now();
  var id = '';
  var fname = '';
  var age = '';
  var message = '';
  var date = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add user"),
        centerTitle: true,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  onChanged: (value) {
                    id = value;
                  },
                  decoration: InputDecoration(
                    hintText: "Id",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  onChanged: (value) {
                    fname = value;
                  },
                  decoration: InputDecoration(
                    hintText: "Full name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  onChanged: (value) {
                    age = value;
                  },
                  decoration: InputDecoration(
                    hintText: "Age",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  onChanged: (value) {
                    message = value;
                  },
                  decoration: InputDecoration(
                    hintText: "Message",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () async {
                      final date = await pickDate();
                      if (date == null) return;
                      setState(() {
                        dateTime = date;
                      });
                    },
                    child: Text(
                        '${dateTime.year}/${dateTime.month}/${dateTime.day}')),
                ElevatedButton(
                    onPressed: () {
                      User user = User(
                          id: id,
                          fname: fname,
                          age: age,
                          message: message,
                          date: date);
                      getIt<UserRepository>().addUser(user);
                    },
                    child: const Text("ADD")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/viewUser');
                    },
                    child: const Text("View users")),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(1900),
      lastDate: DateTime.now());
}
