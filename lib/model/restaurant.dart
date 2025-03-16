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
      category: FoodCategory.Burgers,
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
      category: FoodCategory.Salads,
      availableAddons: [
        Addon(name: "Yougart", price: 0.99),
        Addon(name: "Mayonease", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    Food(
      name: "Asian Sesame Salad",
      description: "This Asian Sesame Chicken Salad is a great way to secretly pack your family’s diet with a ton of vegetables. Hearty cabbage and greens are topped off with cooked chicken and crunchy almonds, then tossed in an Asian sesame ginger dressing.",
      imagePath: "lib/images/salads/asiansesame_salad.jpeg",
      price: 1.50,
      category: FoodCategory.Salads,
      availableAddons: [
        Addon(name: " ", price: 0.00),
        Addon(name: " ", price: 0.00),
        Addon(name: " ", price: 0.00),
      ],
    ),
    Food(
      name: "Caesar Salad",
      description: "This classic Caesar salad recipe features crisp romaine, crunchy croutons, and Parmesan cheese. A creamy, tangy homemade dressing ties it together.",
      imagePath: "lib/images/salads/ceasar_salad.jpeg",
      price: 1.20,
      category: FoodCategory.Salads,
      availableAddons: [
        Addon(name: " ", price: 0.00),
        Addon(name: " ", price: 0.00),
        Addon(name: " ", price: 0.00),
      ],
    ),
    Food(
      name: "Greek Salad",
      description: "This easy Greek salad recipe is our new favorite summer side dish! Just 7 ingredients + a simple Greek salad dressing make it refreshing & delicious.",
      imagePath: "lib/images/salads/greek_salad.jpeg",
      price: 1.20,
      category: FoodCategory.Salads,
      availableAddons: [
        Addon(name: " ", price: 0.00),
        Addon(name: " ", price: 0.00),
        Addon(name: " ", price: 0.00),
      ],
    ),
    Food(
      name: "Southwesst Salad",
      description: "This Southwest Salad recipe has quickly become one of my most popular and most pinned recipes of all time.  It’s fresh, filling, flavorful, gluten-free and will have you actually CRAVING salad!",
      imagePath: "lib/images/salads/southwest_salad.jpg",
      price: 1.20,
      category: FoodCategory.Salads,
      availableAddons: [
        Addon(name: " ", price: 0.00),
        Addon(name: " ", price: 0.00),
        Addon(name: " ", price: 0.00),
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