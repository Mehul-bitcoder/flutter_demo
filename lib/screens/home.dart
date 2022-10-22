import 'package:appdemo/custom_pallete.dart';
import 'package:appdemo/models/catalog.dart';
import 'package:appdemo/widgets/drawer.dart';
import 'package:appdemo/widgets/item_widget.dart';
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
              const CatalogList().expand()
            else
              CircularProgressIndicator().centered().expand()
          ],
        ),
      )),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      "Catalog App"
          .text
          .xl5
          .bold
          .color(MyTheme.darkBluishColor)
          .make(), //same as text widget with styles
      "Trending Products".text.xl2.make()
    ]);
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          return CatalogItem(catalog: catalog);
        });
  }
}

class CatalogItem extends StatelessWidget {
  const CatalogItem({super.key, required this.catalog});

  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          CatalogImage(
            image: catalog.image,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.xl.bold.color(MyTheme.darkBluishColor).make(),
                catalog.desc.text.textStyle(context.captionStyle).make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog.price}".text.bold.lg.make(),
                    ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                MyTheme.darkBluishColor),
                            shape: MaterialStateProperty.all(StadiumBorder())),
                        child: "Buy".text.make())
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    )).white.rounded.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  const CatalogImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: MyTheme.creamColor, borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.all(8),
        child: Image.network(image).w40(context));
  }
}
