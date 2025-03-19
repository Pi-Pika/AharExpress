import 'package:first_app/model/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:first_app/model/restaurant.dart';

import '../components/my_cart_tile.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      //cart
      final userCart = restaurant.cart;

      //scaffodl UI
      return Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            // clear cart button
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Are you sure you want to clear the cart?"),
                    actions: [
                      //cancel button
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancel"),
                      ),

                      //confirm button
                      TextButton(
                        onPressed: () {
                          restaurant.clearCart();
                          Navigator.pop(context);
                        },
                        child: const Text("Confirm"),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: userCart.length,
                  itemBuilder: (context, index) {
                    // get individual cart item
                    final cartItem = userCart[index];

                    //return cart tile item
                    return MyCartTile(
                      cartItem: cartItem,
                    );
                  }),
            ),
          ],
        ),
      );
    });
  }
}
