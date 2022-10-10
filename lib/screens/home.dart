import "package:flutter/material.dart";

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo App"),
      ),
      body: Center(
        child: Container(
          child: const Text("Hello World"),
        ),
      ),
      drawer: const Drawer(),
    );
  }
}
