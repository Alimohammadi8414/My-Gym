import 'package:flutter/material.dart';
import 'package:gym_app/Screens/utils/http_client.dart';
import 'package:gym_app/models/user.dart';

class UserService {
  static ValueNotifier<List<User>> usersList = ValueNotifier([]);

// گرفتن کاربران

  static Future<List<User>> getuser() async {
    var response = await httpclient.get('zxV4xE/gym');

    if (response.statusCode == 200 || response.statusCode == 201) {
      usersList.value = [];

      for (var element in response.data) {
        usersList.value.add(User.fromjson(element));
      }
      return usersList.value;
    }
    throw Exception('Error');
  }

// گرفتن کاربران بر اساس نام و نام خانوادگی

  static Future<List<User>> getUserByFullname(String fullname) async {
    var response = await httpclient.get('zxV4xE/gym?Full Name=$fullname');

    if (response.statusCode == 200 || response.statusCode == 201) {
      usersList.value = [];

      for (var element in response.data) {
        usersList.value.add(User.fromjson(element));
      }
      return usersList.value;
    }
    throw Exception('Error');
  }

  // اضافه کردن کاربر

 static Future<User> adduser(User user) async {
    var response = await httpclient.post('zxV4xE/gym', data: user.tojson());
    if (response.statusCode == 200 || response.statusCode == 201) {
      await getuser();
      return User.fromjson(response.data);
    }
    throw Exception('Error');
  }

// ویرایش کاربران
  static Future<User> updateUser({required User user, required int userid}) async {
    var response =
        await httpclient.put('zxV4xE/gym/$userid', data: user.tojson());
    if (response.statusCode == 200 || response.statusCode == 201) {
      await getuser();
      return User.fromjson(response.data);
    }
    throw Exception('Error');
  }
// خذف کاربر

static Future<User> deleteUser(int userId) async {
    var response = await httpclient.delete(
      'zxV4xE/gym/$userId',
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      await getuser();
      return User.fromjson(response.data);
    }
    throw Exception('Error');
  }
}
