import 'package:appdemo/models/catalog.dart';
import 'package:appdemo/screens/home_details.dart';
import 'package:appdemo/widgets/catalog_item.dart';
import 'package:appdemo/widgets/theme.dart';
import "package:flutter/material.dart";
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final Item catalog = CatalogModel.items[index];
          return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeDetailPage(catalog: catalog))),
              child: CatalogItem(catalog: catalog));
        });
  }
}
