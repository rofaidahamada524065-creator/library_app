import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:library_app/Provider/auth_provider.dart';
import 'package:library_app/Provider/library_provider.dart';
import 'package:library_app/Screens/home_page.dart';
import 'package:library_app/Screens/signup.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => LibraryProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: Signup(),
      ),
    );
  }
}
