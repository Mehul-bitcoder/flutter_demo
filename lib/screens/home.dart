import 'package:appdemo/models/catalog.dart';
import 'package:appdemo/widgets/catalog_header.dart';
import 'package:appdemo/widgets/catalog_list.dart';
import 'package:appdemo/widgets/theme.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import "dart:convert";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items =
        List.from(productsData).map((item) => Item.fromJsom(item)).toList();

    setState(
        () {}); // need to call this once after the data has been loaded from json
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
          child: Container(
        padding: Vx.m16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CatalogHeader(),
            if (CatalogModel.items.isNotEmpty)
              const CatalogList().py16().expand()
            else
              CircularProgressIndicator().centered().expand()
          ],
        ),
      )),
    );
  }
}
