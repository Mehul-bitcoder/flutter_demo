import 'package:appdemo/models/cart.dart';
import 'package:appdemo/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late CatalogModel catalog;
  late CartModel cart;

  MyStore() {
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog; //need to pass a catalog to cart
  }
}
