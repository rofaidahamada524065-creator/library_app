import 'package:flutter/foundation.dart';
import 'package:library_app/Models/auth_model.dart';
import 'package:library_app/Services/auth_services.dart';

class AuthProvider extends ChangeNotifier {
  AuthModel? authModel;
  Future<bool> SignUp({
    required String phoneNumber,
    required String email,
    required String name,
    required String password,
  }) async {
    final response = await AuthServices.SignUpRequest(
      phoneNumber: phoneNumber,
      email: email,
      name: name,
      password: password,
    );

    notifyListeners();
    authModel = response;
    return response.statusCode;
  }

  Future<bool> Login({required String email, required String password}) async {
    final response = await AuthServices.LoginRequest(
      email: email,
      password: password,
    );
    authModel = response;

    notifyListeners();
    return response.statusCode;
  }
}
