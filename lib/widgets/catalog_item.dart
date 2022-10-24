import 'package:appdemo/models/cart.dart';
import 'package:appdemo/models/catalog.dart';
import "package:flutter/material.dart";
import 'package:velocity_x/velocity_x.dart';
import 'package:appdemo/widgets/theme.dart';

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
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(
              image: catalog.image,
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.xl.bold
                    .color(Theme.of(context).colorScheme.secondary)
                    .make(),
                catalog.desc.text.textStyle(context.captionStyle).make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog.price}".text.bold.lg.make(),
                    _AddToCart(
                      catalog: catalog,
                    )
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    )).color(Theme.of(context).cardColor).rounded.square(150).make().py16();
  }
}

class _AddToCart extends StatefulWidget {
  final Item catalog;
  const _AddToCart({Key? key, required this.catalog}) : super(key: key);

  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          isAdded = !isAdded;
          final _catalog = CatalogModel();
          final _cart = CartModel();
          _cart.catalog = _catalog;
          _cart.add(widget.catalog);
          setState(() {});
        },
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Theme.of(context).primaryColor),
            shape: MaterialStateProperty.all(StadiumBorder())),
        child: isAdded ? Icon(Icons.done) : "Add to cart".text.make());
  }
}

class CatalogImage extends StatelessWidget {
  const CatalogImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.all(8),
        child: Image.network(image).w32(context));
  }
}
