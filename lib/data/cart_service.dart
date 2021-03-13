import 'package:simple_bloc/data/product_service.dart';
import 'package:simple_bloc/models/cart_item.dart';

class CartService {
  static List<CartItem> cartItems = [];
  static CartService _singleton = CartService._internal();
  CartService._internal();
  factory CartService() {
    return _singleton;
  }

  static void addToCart(CartItem cartItem) {
    cartItems.add(cartItem);
  }

  static void removeFromCart(CartItem cartItem) {
    cartItems.remove(cartItem);
  }

  static List<CartItem> getCartItems() {
    return cartItems;
  }
}
