import 'package:collection/collection.dart';
import 'package:first_app/model/cart_item.dart';
import 'package:flutter/cupertino.dart';
import 'food.dart';

class Restaurant extends ChangeNotifier {
  //list of food menu
  final List<Food> _menu = [
    //burgers
    Food(
      name: "Classic CheeseBurger",
      description:
          "A Juicy beef patty with melted cheddar, lettuce, tomato, and  a hint of onion and pickle.",
      imagePath: "lib/images/burgers/cheese_burger.jpeg",
      price: 0.99,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    Food(
      name: "Aloha Burger",
      description:
          "Plump and juicy beef patties, grilled pineapples and a special creamy burger sauce, these Aloha Burgers are extra special and delicious!",
      imagePath: "lib/images/burgers/aloha_burger.jpg",
      price: 1.52,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Oninon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    Food(
      name: "BBQ Burger",
      description:
          "These BBQ Burgers are an amazingly juicy explosion of sweet, tangy, spicy, smokey, crispy deliciousness all at the same time.",
      imagePath: "lib/images/burgers/bbq_burger.jpg",
      price: 2.52,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Oninon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    Food(
      name: "Bluemoon Burger",
      description:
          "Blue Moon Burgers uses premium PNW sourced beef to deliver the best tasting burger around.",
      imagePath: "lib/images/burgers/bluemoon_burger.jpeg",
      price: 3.52,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Oninon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    Food(
      name: "Veggie Burger",
      description:
          "A veggie burger or meatless burger is a hamburger made with a patty that does not contain meat, or the patty of such a hamburger. ",
      imagePath: "lib/images/burgers/vege_burger.jpg",
      price: 0.99,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Oninon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),

    //salad
    Food(
      name: "Quinoa Salad",
      description:
          "This quinoa salad recipe is the best! Everyone loves this healthy quinoa salad made with quinoa, chickpeas, red bell pepper, cucumber, parsley and lemon.",
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
      description:
          "This Asian Sesame Chicken Salad is a great way to secretly pack your family’s diet with a ton of vegetables. Hearty cabbage and greens are topped off with cooked chicken and crunchy almonds, then tossed in an Asian sesame ginger dressing.",
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
      description:
          "This classic Caesar salad recipe features crisp romaine, crunchy croutons, and Parmesan cheese. A creamy, tangy homemade dressing ties it together.",
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
      description:
          "This easy Greek salad recipe is our new favorite summer side dish! Just 7 ingredients + a simple Greek salad dressing make it refreshing & delicious.",
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
      description:
          "This Southwest Salad recipe has quickly become one of my most popular and most pinned recipes of all time.  It’s fresh, filling, flavorful, gluten-free and will have you actually CRAVING salad!",
      imagePath: "lib/images/salads/southwest_salad.jpg",
      price: 1.20,
      category: FoodCategory.Salads,
      availableAddons: [
        Addon(name: " ", price: 0.00),
        Addon(name: " ", price: 0.00),
        Addon(name: " ", price: 0.00),
      ],
    ),

    // sides

    //deserts

    //drinks
  ];
  /*
  G E T T E R S
  */

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  /*
  O P R E R A T I O N S
  */

  //user cart
  final List<CartItem> _cart = [];

  // add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    // see if there is a cart item already with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the food items are the same
      bool isSameFood = item.food == food;

      // check if the list of selected addons are the same
      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    // if item already exists, increase it's quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }

    // otherwise, add a new cart item to the cart
    else {
      _cart.add(
        CartItem(
          food: food,
          selectedAddons: selectedAddons,
        ),
      );
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }

    notifyListeners();
  }

  // get total price of the cart
  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  //get total number of items from cart
  int getTotalItamCount() {
    int totalItamCount = 0;

    for (CartItem cartItem in _cart) {
      totalItamCount += cartItem.quantity;
    }

    return totalItamCount;
  }

  //clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  /*
  H E L P E R S
  */

  // generate a receipt

  // format double value into money

  //format list of addons into a string summary
}
