import 'package:simple_bloc/models/product.dart';

class CartItem {
  Product product;
  int quantity;

  CartItem(this.product, this.quantity);
}
