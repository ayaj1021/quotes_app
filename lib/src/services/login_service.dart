import 'package:dio/dio.dart';
import 'package:quotes_app/src/model/login_model.dart';

class LoginService {
  Future<LoginUserModel?> login(String email, String password) async {
    Dio dio = Dio();
    const endpoint = 'https://reqres.in/api/login';
//  Response response;

    final data = {
      "email": email,
      "password": password,
    };

    final response = await dio.post(endpoint, data: data);

    if (response.statusCode == 200) {
      final body = response.data;
      print(response.data);
      return LoginUserModel(email: email, 
      password: password
      //token: body['token '],
      );
    } else {
      return null;
    }
  }
}
