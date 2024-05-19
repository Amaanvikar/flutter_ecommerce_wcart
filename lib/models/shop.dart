import 'package:flutter/material.dart';

import 'product.dart';

class Shop extends ChangeNotifier {
  final List<Product> _shop = [
    Product(
      name: "Product 1",
      price: 99.99,
      description: "Air Jordan 4 Retro Vivid Sulfur, fresh take on the timeless silhouette that has defined sneaker culture.",
      imagepath: 'images/nikeretro.png'
    ),
    Product(
      name: "Product 2",
      price: 50.99,
      description: "Accessories with the crystal straightforward design's sophisticated touch.",
      imagepath: 'images/sunglasses.png'
      
    ),
    Product(
      name: "Product 3",
      price: 90.99,
      description: "watch is designed, produced and tested with constant attention to the tiniest of details.",
      imagepath: 'images/watch.png'
    ),
    Product(
      name: "Product 4",
      price: 80.99,
      description: "hacking made more look like while hoodie on",
      imagepath: 'images/hoodie.png'
      
    )
  ];

   List<Product> _cart = [];

   List<Product> get shop => _shop;

   List<Product> get cart => _cart;

   void addToCart(Product item){
    _cart.add(item);
    notifyListeners();
   }

   void removeFromCart(Product item){
    _cart.remove(item);
    notifyListeners();
   }


}
