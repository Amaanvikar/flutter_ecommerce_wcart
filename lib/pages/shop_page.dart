import 'package:cart/components/my_drawer.dart';
import 'package:cart/components/my_product_tile.dart';
import 'package:cart/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {

    final product = context.watch<Shop>().shop;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        title:const Text(
          "Shop Page"
          ),
          centerTitle: true,
          actions: [IconButton(onPressed: () => Navigator.pushNamed(context, '/cart_page'), icon: const Icon(Icons.shopping_cart_outlined))],
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          const SizedBox(height: 25),
          Center(
            child: Text(
              "Pick from a selected list of premium products",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary),
              ),
              ),
          SizedBox(
        height: 550,
        child: ListView.builder(
          itemCount: product.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(15),
          itemBuilder: (context, index){
        
            final Product = product[index]; 
        
            return MyProductTile(product: Product);
          },
        ),
      ),
        ],
      ),
    ); 
  }
}