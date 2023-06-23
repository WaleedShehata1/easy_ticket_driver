// ignore_for_file: non_constant_identifier_names, avoid_init_to_null

class SignInModel {
  bool? status;
  String? message;
  String? token;
  UserData? data;

  SignInModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
}

class UserData {
  String? id_driver;
  String? first_Name;
  String? last_Name;
  String? password;
  UserData.fromJson(Map<String, dynamic> json) {
    id_driver = json['id_driver'].toString();
    first_Name = json['first_Name'];
    last_Name = json['last_Name'];
  }
}

// class User {
//   String? uid;
//   String? first_Name;
//   String? last_Name;
//   String? email;
//   User({
//     this.uid,
//     this.first_Name,
//     this.last_Name,
//     this.email,
//   });
// }
