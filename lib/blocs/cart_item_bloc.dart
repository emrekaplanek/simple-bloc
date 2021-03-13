import 'dart:async';

import 'package:simple_bloc/data/cart_service.dart';
import 'package:simple_bloc/models/cart_item.dart';

class CartItemBloc {
  final cartStreamController = StreamController.broadcast();

  Stream get getStream => cartStreamController.stream;

  void addToCart(CartItem cartItem) {
    CartService.addToCart(cartItem);
    cartStreamController.sink.add(CartService.getCartItems());
  }

  void removeFromCart(CartItem cartItem) {
    CartService.removeFromCart(cartItem);
    cartStreamController.sink.add(CartService.getCartItems());
  }

  List<CartItem> getCartItems() {
    return CartService.getCartItems();
  }
}

final cartItemBloc = CartItemBloc();
