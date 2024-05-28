import 'package:auth_app_admin/controller/user_db_helper.dart';
import 'package:auth_app_admin/model/user_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    User().getUsersFromDB();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserList'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 224, 248, 88),
      ),
      body: ListView.builder(
            itemCount:userList.length,
            itemBuilder: (context, index) {
               UserModel user = userList[index];
               return  Card(
                 child: ListTile(
                   title: Text(user.name!),
                   subtitle: Text(user.phone!),
                   trailing: IconButton(onPressed: (){
                     User().deleteUserFromDB(user.id!);
                     }, icon: const Icon(Icons.delete),)
                     ),
               );
            } ,
            )
    );
  }
}