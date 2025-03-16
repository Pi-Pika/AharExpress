import 'package:flutter/cupertino.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier{

  //list of food menu
  final List<Food> _menu = [
    //burgers
    Food(
      name: "Classic CheeseBurger",
      description: "A Juicy beef patty with melted cheddar, lettuce, tomato, and  a hint of onion and pickle.",
      imagePath: "lib/images/burgers/cheese_burger.jpeg",
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    //salad
    Food(
      name: "Quinoa Salad",
      description: "This quinoa salad recipe is the best! Everyone loves this healthy quinoa salad made with quinoa, chickpeas, red bell pepper, cucumber, parsley and lemon.",
      imagePath: "lib/images/salads/quinoa_salad.jpeg",
      price: 1.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Yougart", price: 0.99),
        Addon(name: "Mayonease", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
  ];
  /*
  G E T T E R S
  */

  List<Food> get menu => _menu;

  /*
  O P R E R A T I O N S
  */

  // add to cart

  // remove from cart

  //get total number of items from cart

  //clear cart

  /*
  H E L P E R S
  */

  // generate a receipt

  // format double value into money

  //format list of addons into a string summary
}