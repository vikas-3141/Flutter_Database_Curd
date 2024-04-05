import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
class Api_Create
{
  Future<List<dynamic>> getAll()
  async {
    var res= await http.get(Uri.parse("https://65de9e82dccfcd562f571b22.mockapi.io/Faculty_Api"));
    List<dynamic> add= jsonDecode(res.body);
    return add;
  }

  Future<void> delete(String id)
  async {
      var de=await http.delete(Uri.parse("https://65de9e82dccfcd562f571b22.mockapi.io/Faculty_Api/$id"));
  }

  Future<Map> Insert(Map<dynamic,dynamic> map) async {
    var get = await http.post(Uri.parse("https://65de9e82dccfcd562f571b22.mockapi.io/Faculty_Api"),headers: {"Content-Type":"application/json"},body: jsonEncode(map));
    Map<dynamic,dynamic> User = jsonDecode(get.body);
    return User;
  }

  Future<Map> Update(Map<dynamic,dynamic> map,String id) async {
    var get = await http.post(Uri.parse("https://65de9e82dccfcd562f571b22.mockapi.io/Faculty_Api/$id"),headers: {"Content-Type":"application/json"},body: jsonEncode(map));
    Map<dynamic,dynamic> de = jsonDecode(get.body);
    return de;
  }
}