import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:library_app/Provider/auth_provider.dart';
import 'package:library_app/Screens/home_page.dart';
import 'package:library_app/Screens/login.dart';
import 'package:library_app/Screens/signup.dart';
import 'package:library_app/Widget/textfield_custom.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  new({super.key});
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Object = context.read<AuthProvider>();
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _globalKey,
        child: Center(
          child: Column(
            crossAxisAlignment: .center,
            mainAxisAlignment: .center,
            children: [
              Icon(Icons.account_circle, color: Colors.pink, size: 150),

              Text("Login", style: TextStyle(color: Colors.pink, fontSize: 40)),
              TextfieldCustom(
                text: "Email",
                Picon: Icons.email,
                controlar: email,
              ),
              TextfieldCustom(
                text: "Password",
                Picon: Icons.lock,
                controlar: password,
                Sicon: Icons.visibility,
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                onPressed: () async {
                  if (_globalKey.currentState!.validate()) {
                    final succes = await Object.Login(
                      email: email.text,

                      password: password.text,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("${Object.authModel?.message ?? ""}"),
                        backgroundColor: succes
                            ? Colors.greenAccent
                            : Colors.red,
                      ),
                    );
                    if (succes) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    }
                  }
                },
                child: Text("Login", style: TextStyle(color: Colors.white)),
              ),
              Row(
                crossAxisAlignment: .center,
                mainAxisAlignment: .center,
                children: [
                  Text("Don't Have account ? "),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Signup()),
                      );
                    },
                    child: Text("SignUp", style: TextStyle(color: Colors.pink)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
