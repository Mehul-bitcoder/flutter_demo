import 'package:appdemo/models/catalog.dart';
import 'package:appdemo/widgets/drawer.dart';
import 'package:appdemo/widgets/item_widget.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
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
      appBar: AppBar(
        title: const Text("Demo App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: (CatalogModel.items.isNotEmpty)
            ? ListView.builder(
                itemCount: CatalogModel.items.length,
                itemBuilder: (context, index) => ItemWidget(
                      item: CatalogModel.items[index],
                    ))
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
