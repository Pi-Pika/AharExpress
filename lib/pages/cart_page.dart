import 'package:first_app/model/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:first_app/model/restaurant.dart';

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
          title: Text("Cart"),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
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
                    return ListTile(
                      title: Text(cartItem.food.name),
                    );
                  }),
            ),
          ],
        ),
      );
    });
  }
}
