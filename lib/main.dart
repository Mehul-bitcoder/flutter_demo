import 'package:appdemo/custom_pallete.dart';
import 'package:appdemo/screens/cart.dart';
import 'package:appdemo/screens/home.dart';
import 'package:appdemo/screens/login.dart';
import 'package:appdemo/utils/routes.dart';
import 'package:appdemo/widgets/theme.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const DemoApp());
}

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Home(),
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      debugShowCheckedModeBanner: false,
      routes: {
        "/": ((context) => const Login()),
        MyRoutes.homeRoute: ((context) => const Home()),
        MyRoutes.loginRoute: ((context) => const Login()),
        MyRoutes.cartRoute: ((context) => const Cart()),
      },
    );
  }
}
