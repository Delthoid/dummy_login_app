import 'package:dummy_login_app/models/profile_model.dart';
import 'package:dummy_login_app/models/user_list_model.dart';
import 'package:dummy_login_app/providers/app_provider.dart';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

class ProfileProvider extends ChangeNotifier {
  late Data userInfo = Data(
    id: 0,
    email: '',
    firstName: '',
    lastName: '',
    avatar: '',
  );
  late List<Datum> dataList = [];
  bool profileLoading = false;
  String userEmail = '';

  Future<void> fetchUserInfo(String email) async {
    userEmail == '' ? userEmail = email : userEmail = '';
    for (var i = 0; i < dataList.length; i++) {
      if (dataList.elementAt(i).email == email) {
        Datum _data = dataList.elementAt(i);
        userInfo = Data(
          id: _data.id,
          email: _data.email,
          firstName: _data.firstName,
          lastName: _data.lastName,
          avatar: _data.avatar,
        );
        break;
      } else {}
    }
    notifyListeners();
  }

  Future<void> getUsers(String email) async {
    var response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=1'));

    if (response.statusCode == 200) {
      dataList = usersListModelFromMap(response.body).data;
    } else {
      print('Something went wrong');
    }
    await getUsers2();
    fetchUserInfo(email);
  }

  //Get the second page of the users
  Future<void> getUsers2() async {
    var response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=2'));

    if (response.statusCode == 200) {
      dataList.addAll(usersListModelFromMap(response.body).data);
    } else {
      print('Something went wrong');
    }
    notifyListeners();
  }
}
