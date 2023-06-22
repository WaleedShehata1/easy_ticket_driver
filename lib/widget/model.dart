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
  String? uid;
  String? first_Name;
  String? last_Name;
  String? national_ID;
  String? gender;
  String? date_of_birth;
  String? phone;
  String? salary;
  String? password;
  UserData.fromJson(Map<String, dynamic> json) {
    uid = json['id'].toString();
    national_ID = json['national_ID'].toString();
    first_Name = json['first_Name'];
    last_Name = json['last_Name'];
    phone = json['phone'];
    salary = json['salary'];
    date_of_birth = json['date_of_birth'];
    gender = json['gender'];
  }
}

class User {
  String? uid;
  String? first_Name;
  String? last_Name;
  String? national_ID;
  String? gender;
  String? date_of_birth;
  String? phone;
  String? salary;
  User(
      {this.uid,
      this.first_Name,
      this.last_Name,
      this.national_ID,
      this.phone,
      this.date_of_birth,
      this.gender,
      this.salary});
}

////////////////////////////////

class Bus {
  bool? status;
  String? message;
  UserData? data;

  Bus.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
}

class listBus {
  List<Map<String, dynamic>> bus = [];

  listBus.fromJson(Map<String, dynamic> json) {
    var itemList = json["data"] as List;
    bus = itemList.map((e) => Map<String, dynamic>.from(e)).toList();
  }
}
