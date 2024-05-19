import 'package:cart/models/product.dart';
import 'package:cart/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;

  const MyProductTile({
  super.key, 
  required this.product});


  void addTocart (BuildContext context){
    showDialog(
    context: context, 
    builder: (context) => AlertDialog(
      content: Text("Add this product to cart?"),
      actions: [
        MaterialButton(
          onPressed: () => Navigator.pop(context),
        child: const Text("Cancel"),
        ),
        MaterialButton(
          onPressed: () {

            Navigator.pop(context);

            context.read<Shop>().addToCart(product);
          },
        child: const Text("Yes"),
        ),
      ],
    ), 
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(25),
        width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [


          Column(
            children: [
            AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(12),
                ),
                width: double.infinity,
               padding: const EdgeInsets.all(25), 
              child: Image.asset(product.imagepath),
              ),
          ),

          const SizedBox(height: 25),

          Text(
            product.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
          fontSize: 20,
          ),
          ),


          const SizedBox(height: 10),

          Text(
            product.description,
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              ),
              ),
          ],
          ), 


              
          const SizedBox(height: 25),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$'+product.price.toStringAsFixed(2)),


              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(12)),
                child: IconButton(onPressed: () => addTocart(context), 
                icon: const Icon(Icons.add),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}