// import 'dart:async';
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:nb_utils/nb_utils.dart';
// import 'package:quotes_app/src/utils/app_url.dart';

// enum Status {
//   NotLoggedIn,
//   NotRegistered,
//   LoggedIn,
//   Registered,
//   Authenticating,
//   Registering,
//   LoggedOut,
// }

// class AuthProvider extends ChangeNotifier {
//   Status _loggedInStatus = Status.NotLoggedIn;
//   Status _registeredInStatus = Status.NotRegistered;

//   Status get loggedInStatus => _loggedInStatus;

//   set loggedInStatus(Status value) {
//     _loggedInStatus = value;
//   }

//   Status get registeredInStatus => _registeredInStatus;

//   set registeredInStatus(Status value) {
//     _registeredInStatus = value;
//   }

//   Future<Map<String, dynamic>> register(String email, String password) async {
//     final Map<String, dynamic> apiBodyData = {
//       'email': email,
//       'password': password,
//     };

//     return await post(
//       AppUrl.signup,
//       body: json.encode(apiBodyData),
//       headers: {'Content-Type': 'application/json'},
//     ).then(onValue).catchError(onError);
//   }

//   static Future<FutureOr> onValue(Response response) async {
//     var result;

//     final Map<String, dynamic> responseData = json.decode(response.body);

//     print(responseData);

//     if (response.statusCode == 200) {
//       var userData = responseData['date'];
//     }
//   }
// }
