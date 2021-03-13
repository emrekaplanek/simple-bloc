import 'package:flutter/material.dart';
import 'package:simple_bloc/blocs/cart_item_bloc.dart';

class CartItemListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(("Sepet"))),
      body: StreamBuilder(
        stream: cartItemBloc.getStream,
        initialData: cartItemBloc.getCartItems(),
        builder: (context, snapshot) {
          return snapshot.data.length > 0 ? buildCart(snapshot) : SizedBox();
        },
      ),
    );
  }

  buildCart(AsyncSnapshot snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, index) {
          final cart = snapshot.data;
          return ListTile(
            title: Text(cart[index].product.name),
            subtitle: Text(cart[index].product.price.toString()),
            trailing: IconButton(
              icon: Icon(Icons.remove_shopping_cart),
              onPressed: () {
                cartItemBloc.removeFromCart(cart[index]);
              },
            ),
          );
        });
  }
}
