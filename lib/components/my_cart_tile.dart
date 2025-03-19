import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:first_app/model/restaurant.dart';
import 'package:first_app/model/cart_item.dart';

class CartPage extends StatelessWidget {
  final CartItem cartItem;

  const CartPage({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
        builder: (context, restaurant, child) => Container(
          child: Column(
            children: [
              Row(
                children: [
                  //food image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      cartItem.food.imagePath,
                      height: 100,
                      width: 100,
                    ),
                  ),

                  const SizedBox(width: 10),

                  // name and price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //food name
                      Text(cartItem.food.name),

                      //food price
                      Text('Tk.' + cartItem.food.price.toString()),
                    ],
                  ),

                  // increment or decrement quantity

                ],
              ),
            ],
          ),
        )
    );
  }
}
