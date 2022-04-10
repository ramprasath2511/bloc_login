
import 'dart:convert';

import 'package:http/http.dart' as http;

class User {


  late int id;
  String username;
  String password;
  String email;
  String? profilePic;


  User( this.username, this.password, this.email ,this.profilePic);



  @override
  String toString() {
    return 'User{id: $id, username: $username, password: $password, email: $email, profilePic: $profilePic}';
  }

  factory User.fromJson(Map<String, dynamic> json) => User(
    json["username"],
    json["password"],
    json["email"],
    json["profilePic"],
  );
  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
    "email": email,
    "profilePic": profilePic,
  };

}
class Userservice{

Future<String> loginAuth(String email, String password  ) async {
  String url = "http://192.168.99.1:8080";
  Map<String, String> headers = <String, String>{
    'Content-Type': 'text/plain',
  };
  Map<String, String> fields = <String, String>{
    'email': email,
    'password': password,
  };
  var request = http.MultipartRequest("POST", Uri.parse(url + "/login"))
    ..headers.addAll(headers)
    ..fields.addAll(fields);
  var response = await request.send();
    String streamedResponse = await response.stream.bytesToString();
    print(jsonDecode(streamedResponse));
    return jsonDecode(streamedResponse).toString();

}}