import 'package:appdemo/core/store.dart';
import 'package:appdemo/models/cart.dart';
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
      body: Column(children: [
        _CartList().p32().expand(),
        const Divider(),
        _CartTotal()
      ]),
    );
  }
}

class _CartTotal extends StatelessWidget {
  final CartModel _cart = (VxState.store as MyStore).cart;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
              builder: (context, status, store) {
                return "\$${_cart.totalPrice}"
                    .text
                    .xl5
                    .color(Theme.of(context).colorScheme.secondary)
                    .make();
              },
              mutations: {RemoveMutation}),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: "Buying not supported yet".text.make()));
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(context.primaryColor)),
                  child: "Buy".text.make())
              .w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Cart is Empty".text.xl2.makeCentered()
        : ListView.builder(
            shrinkWrap: true,
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
                  leading: const Icon(Icons.done),
                  trailing: IconButton(
                    onPressed: () {
                      RemoveMutation(_cart.items[index]);
                    },
                    icon: const Icon(Icons.remove_circle_outline),
                  ),
                  title: _cart.items[index].name.text.make(),
                ));
  }
}
