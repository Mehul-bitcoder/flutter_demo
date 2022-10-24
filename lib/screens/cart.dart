import 'package:appdemo/widgets/theme.dart';
import "package:flutter/material.dart";
import "package:velocity_x/velocity_x.dart";

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      backgroundColor: context.canvasColor,
    );
  }
}
