// import 'dart:convert';









// // ignore_for_file: public_member_api_docs, sort_constructors_first
// class SignupModel {
//   String userName;
//   String email;
//   String password;
//   String confirmPassword;
//   SignupModel({
//     required this.userName,
//     required this.email,
//     required this.password,
//     required this.confirmPassword,
//   });

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'userName': userName,
//       'email': email,
//       'password': password,
//       'confirmPassword': confirmPassword,
//     };
//   }

//   factory SignupModel.fromMap(Map<String, dynamic> map) {
//     return SignupModel(
//       userName: map['userName'] as String,
//       email: map['email'] as String,
//       password: map['password'] as String,
//       confirmPassword: map['confirmPassword'] as String,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory SignupModel.fromJson(String source) => SignupModel.fromMap(json.decode(source) as Map<String, dynamic>);
// }
