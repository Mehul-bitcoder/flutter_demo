import 'package:appdemo/models/catalog.dart';

class CartModel {
  static final cartModel = CartModel._internal();
  CartModel._internal();
  factory CartModel() => cartModel;
  //catalog field
  late CatalogModel _catalog;
  //Collections of id
  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  //get items in cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //get total value

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // addItems
  void add(Item item) {
    _itemIds.add(item.id);
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
