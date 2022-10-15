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

  final _formkey = GlobalKey<FormState>();

  navigateToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        isChange = !isChange;
      });
      await Future.delayed(Duration(milliseconds: 250));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        isChange = !isChange;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
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
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username cannot be empty";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          labelText: "Password", hintText: "Enter password"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password cannot be empty";
                        }
                        if (value.length < 6) {
                          return "Password cannot be less than 6";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Material(
                      color: Color.fromRGBO(97, 89, 255, 1),
                      borderRadius: BorderRadius.circular(isChange ? 50 : 8),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(isChange ? 50 : 8),
                        onTap: () => navigateToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 250),
                          height: 50,
                          width: isChange ? 50 : 150,
                          alignment: Alignment.center,
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
                      ),
                    )
                  ],
                ),
              )
            ]),
          ),
        ));
  }
}
