import 'package:auth_app_admin/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

List<UserModel> userList = [];

class User {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  getUsersFromDB() async {
    try {
      print("function is called");
      final users = await firestore.collection("userss").get();
      userList.clear();
      for (var element in users.docs) {
        userList.add(UserModel.fromMap(element));
      }
      return userList;
    } on Exception catch (e) {
      print("the error is found $e");
    }
  }

  deleteUserFromDB(String id) async {
    try {
      print("function is called");
      await firestore.collection("userss").doc(id).delete();
      getUsersFromDB();
    } catch (e) {
      print('error on $e');
    }
  }
}
