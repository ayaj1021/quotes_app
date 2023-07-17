class LoginUserModel {
  String? email;
  String? password;

  LoginUserModel({this.email, this.password});

  LoginUserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}

class UserModel {
  final String email;
  final String token;

  UserModel({required this.email,required this.token});
}
