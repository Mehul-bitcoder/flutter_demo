import 'package:appdemo/custom_pallete.dart';
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
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 16),
                itemBuilder: ((context, index) {
                  final item = CatalogModel.items[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: GridTile(
                      header: Container(
                        color: midBlue,
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          item.name,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      footer: Text(item.price.toString()),
                      child: Image.network(item.image),
                    ),
                  );
                }),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
