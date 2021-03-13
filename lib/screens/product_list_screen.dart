import 'package:flutter/material.dart';
import 'package:simple_bloc/blocs/cart_item_bloc.dart';
import 'package:simple_bloc/blocs/product_bloc.dart';
import 'package:simple_bloc/models/cart_item.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ürünler"),
        actions: [
          IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () => Navigator.pushNamed(context, "cart")),
        ],
      ),
      body: buildProductList(),
    );
  }

  buildProductList() {
    return StreamBuilder(
        initialData: productBloc.getAll(),
        stream: productBloc.getStream,
        builder: (context, snapshot) {
          return snapshot.data.length > 0
              ? builProducttListItems(snapshot)
              : Center(child: Text("no data"));
        });
  }

  builProducttListItems(AsyncSnapshot snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, index) {
          final list = snapshot.data;
          return ListTile(
            title: Text(list[index].name),
            subtitle: Text(list[index].price.toString()),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart_outlined),
              onPressed: () {
                cartItemBloc.addToCart(CartItem(list[index], 1));
              },
            ),
          );
        });
  }
}
