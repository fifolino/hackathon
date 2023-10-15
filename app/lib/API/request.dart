import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Request {
  final String url = "http://localhost:3001";

  Future<bool> login(String email, String mdp) async {
    // try {
    //   await http.post(Uri.parse("$url/login"),
    //       headers: <String, String>{
    //         'Content-Type': 'application/json; charset=UTF-8',
    //       },
    //       body: jsonEncode({"username": email, "password": mdp}));
      return true;
    // } on HttpException catch (_) {
    //   return false;
    // }
  }

  Future<dynamic> getData() async {
    return http.get(Uri.parse("$url/residences"));
  }
}
