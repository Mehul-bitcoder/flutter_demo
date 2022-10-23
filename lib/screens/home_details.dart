import 'package:appdemo/models/catalog.dart';
import 'package:appdemo/widgets/theme.dart';
import "package:flutter/material.dart";
import "package:velocity_x/velocity_x.dart";

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({super.key, required this.catalog});

  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(context.primaryColor),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Add to cart".text.make())
                .wh(120, 50)
          ],
        ).p20(),
      ),
      body: SafeArea(
          child: Column(children: [
        Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image))
            .h32(context)
            .p24(),
        Expanded(
          child: VxArc(
            height: 20.0,
            arcType: VxArcType.CONVEY,
            edge: VxEdge.TOP,
            child: Container(
              width: context.screenWidth,
              color: context.cardColor,
              child: Column(children: [
                catalog.name.text.xl4.bold
                    .color(MyTheme.darkBluishColor)
                    .make(),
                catalog.desc.text.lg.textStyle(context.captionStyle).make(),
                10.heightBox,
                "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate"
                    .text
                    .textStyle(context.captionStyle)
                    .make()
                    .px16()
              ]).py32(),
            ),
          ),
        )
      ])),
    );
  }
}
