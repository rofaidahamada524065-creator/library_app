import 'package:dio/dio.dart';
import 'package:library_app/Models/auth_model.dart';

class AuthServices {
  static Dio dio = Dio();
  static Future<AuthModel> SignUpRequest({
    required String phoneNumber,
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      Response response = await dio.post(
        "https://librarysystemflutterteam.runasp.net/api/Registration/SignUp",
        data: {
          "name": name,
          "email": email,
          "phoneNumber": phoneNumber,
          "password": password,
        },
      );
      return AuthModel.fromjson(response.data);
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (other) {
      throw Exception("Error : ${other.toString()}");
    }
  }

  static Future<AuthModel> LoginRequest({
    required String email,

    required String password,
  }) async {
    try {
      Response response = await dio.post(
        "https://librarysystemflutterteam.runasp.net/api/Registration/SignIn",
        data: {"email": email, "password": password},
      );
      return AuthModel.fromjson(response.data);
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (other) {
      throw Exception("Error : ${other.toString()}");
    }
  }
}
