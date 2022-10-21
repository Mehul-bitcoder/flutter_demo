import 'package:appdemo/custom_pallete.dart';
import 'package:appdemo/models/catalog.dart';
import "package:flutter/material.dart";

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print("${item.name} pressed");
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price.toString()}",
          textScaleFactor: 1.4,
          style: TextStyle(color: midBlue, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
