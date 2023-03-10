import 'dart:convert';
import 'package:bloc_implement/model/Activity.dart';
import 'package:http/http.dart' as http;

class ApiServiceProvider {

  Future<Activity?> fetchActivity() async {
      final response = await http.get(
        Uri.parse('https://www.boredapi.com/api/activity'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        return Activity.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load');
      }
  }

}
