import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper{

  NetworkHelper(this.Url);
  String Url;

  Future<dynamic> getData() async{
    http.Response res = await http.get(Uri.parse(Url));
    if(res.statusCode == 200){
      return jsonDecode(res.body);
    }
    else{
      print(res.statusCode);
    }

  }
}