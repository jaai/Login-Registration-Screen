import 'dart:convert';

import 'package:flutter_starter_app/models/Items.dart';
import 'package:flutter_starter_app/models/Users.dart';
import 'package:http/http.dart' as http;

class Services {
  static const String url =
      'https://chroniclingamerica.loc.gov/search/titles/results/?year1=2015&year2=2019&rows=10&format=json';

  static const String getUserUrl = 'https://reqres.in/api/users?page=2';
  static Future<List<Items>> getNews() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var res = data['items'] as List;
        final List<Items> items =
            res.map<Items>((json) => Items.fromJson(json)).toList();

        print(items[0].publisher);
        return items;
      } else {
        return List<Items>();
      }
    } catch (e) {
      print(e);
      return List<Items>();
    }
  }

  static Future<List<Items>> getData() async {
    List<Items> list;
    String link =
        "https://chroniclingamerica.loc.gov/search/titles/results/?year1=2015&year2=2019&rows=10&format=json";
    var res = await http
        .get(Uri.encodeFull(link), headers: {"Accept": "application/json"});
    print(res.body);
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      var rest = data["items"] as List;
      print(rest);
      list = rest.map<Items>((json) => Items.fromJson(json)).toList();
    }
    print("List Size: ${list.length}");
    return list;
  }

  static Future<User> getUsers() async {
    try {
      final response = await http.get(getUserUrl);
      if (response.statusCode == 200) {
        final User user = userFromJson(response.body);
        return user;
      } else {
        return User();
      }
    } catch (e) {
      print(e);
      return User();
    }
  }
}
