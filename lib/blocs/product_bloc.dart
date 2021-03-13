import 'dart:async';

import 'package:simple_bloc/data/product_service.dart';
import 'package:simple_bloc/models/product.dart';

class ProductBloc {
  final productStreamController = StreamController.broadcast();

  Stream get getStream => productStreamController.stream;

  List<Product> getAll() {
    return ProductService.getAll();
  }
}

final productBloc = ProductBloc();
