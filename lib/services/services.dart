import 'dart:convert';

import 'package:iottive/model/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:iottive/model/order_history_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constraints/strings.dart';

class Service {
  Future<LoginModel> fetchlogin(String login, String password) async {
    var pswd = Uri.encodeComponent(password);
    String url =
        "${Strings.baseurl}${Strings.login}?phoneManufacturer=apple&password=$pswd&phoneModel=iphone%206s%20plus&OSVersion=13.0&languageCode=en&email=$login&platform=ios";

    var response = await http.post(Uri.parse(url));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      var res = await data;
      if (res["success"] == true) {
        var userId = res["userId"];
        var authtoken = res["authToken"];
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setInt("userId", userId);
        prefs.setString("authtoken", authtoken);
        prefs.setBool("isLogin", res["success"]);
      }
      return LoginModel.fromJson(data);
    } else {
      return LoginModel.fromJson(data);
    }
  }

  Future<OrderHistoryModel> orderhistory() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String authToken = prefs.getString("authtoken");
    int userId = prefs.getInt("userId");
    String url =
        "${Strings.baseurl}${Strings.orderHistory}?authToken=$authToken&userId=$userId";
    var response = await http.post(Uri.parse(url));
    print(response);
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      var res = await data;
      if (res["success"] == true) {
        return OrderHistoryModel.fromJson(data);
      }
    } else {
      return OrderHistoryModel.fromJson(data);
    }
  }
}
