import 'package:simple_bloc/models/product.dart';

class ProductService {
  static List<Product> products = [];
  static ProductService _singleton = ProductService._internal();
  ProductService._internal();
  factory ProductService() {
    return _singleton;
  }

  static List<Product> getAll() {
    products.add(Product(1, "apple", "10"));
    products.add(Product(2, "banana", "20"));
    products.add(Product(3, "orange", "15"));
    return products;
  }
}
