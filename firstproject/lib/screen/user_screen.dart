import 'package:firstproject/controller/users_controller.dart';
import 'package:firstproject/model/user_model.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final controller = UserController();
  List<User> users = [];
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  void loaduser() async {
    final userdata = await controller.getUsers();
    setState(() {
      users = userdata;
    });
  }

  void addUser() async {
    if (nameController.text.isEmpty || emailController.text.isEmpty) {
      return;
    } else {
      final user = User(name: nameController.text, email: emailController.text);
      await controller.addUser(user);
      nameController.clear();
      emailController.clear();
      loaduser();
    }
  }

  void deleteUser(int id) async {
    await controller.deleteUser(id);
    loaduser();
  }

  @override
  void initState() {
    super.initState();
    loaduser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(label: Text("Enter your name")),
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(label: Text("Enter your email")),
          ),
          ElevatedButton(onPressed: () {
            addUser();
          }, child: Text("Add user")),
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  trailing: IconButton(
                    onPressed: () {deleteUser(user.id!);},
                    icon: Icon(Icons.delete),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
