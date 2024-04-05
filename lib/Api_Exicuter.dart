import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class Api_Executor {
  Future<List<dynamic>> getApi() async {
    var get = await http.get(Uri.parse("https://65de9e82dccfcd562f571b22.mockapi.io/Faculty_Api"));
    List<dynamic> User = jsonDecode(get.body);
    return User;
  }

  Future<void> delete(String id) async {
    await http.delete(Uri.parse("https://65de9e82dccfcd562f571b22.mockapi.io/Faculty_Api/$id"));
  }

  Future<Map> insert(Map<dynamic, dynamic> map) async {
    var res = await http.post(
      Uri.parse("https://65de9e82dccfcd562f571b22.mockapi.io/Faculty_Api"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(map),
    );
    Map<dynamic, dynamic> insert = jsonDecode(res.body);
    return insert;
  }

  Future<Map> update(Map<dynamic, dynamic> map) async {
    var res = await http.put(
      Uri.parse("https://65de9e82dccfcd562f571b22.mockapi.io/Faculty_Api/${map['id'].toString()}"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(map),
    );
    Map<dynamic, dynamic> get = jsonDecode(res.body);
    return get;
  }
}
