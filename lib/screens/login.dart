import 'package:appdemo/utils/routes.dart';
import "package:flutter/material.dart";

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = "";
  bool isChange = false;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 25,
            ),
            Image.asset(
              "assets/images/login.png",
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Welcome $name",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: "Username", hintText: "Enter username"),
                    onChanged: ((value) {
                      setState(() {
                        name = value;
                      });
                    }),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        labelText: "Password", hintText: "Enter password"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: (() async {
                      setState(() {
                        isChange = !isChange;
                      });
                      await Future.delayed(Duration(milliseconds: 250));
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    }),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 250),
                      height: 50,
                      width: isChange ? 50 : 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(97, 89, 255, 1),
                          borderRadius:
                              BorderRadius.circular(isChange ? 50 : 8)),
                      child: isChange
                          ? const Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : const Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                    ),
                  )
                  // ElevatedButton(
                  //     style: TextButton.styleFrom(
                  //         backgroundColor: Color.fromRGBO(97, 89, 255, 1),
                  //         minimumSize: Size(200, 40)),
                  //     onPressed: () {
                  //       Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //     },
                  //     child: const Text("Login")
                  //     )
                ],
              ),
            )
          ]),
        ));
  }
}
