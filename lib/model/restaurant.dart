import 'package:collection/collection.dart';
import 'package:first_app/model/cart_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'food.dart';

class Restaurant extends ChangeNotifier {
  //list of food menu
  final List<Food> _menu = [
    //burgers
    Food(
      name: "Jhinku Burger",
      description:
          "A Juicy beef patty with melted cheddar, lettuce, tomato, and  a hint of onion and pickle.",
      imagePath: "lib/images/burgers/cheese_burger.jpeg",
      price: 150.99,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 15.99),
        Addon(name: "Bacon", price: 14.99),
        Addon(name: "Avocado", price: 12.99),
      ],
    ),
    Food(
      name: "Osthir Burger",
      description:
          "Plump and juicy beef patties, grilled pineapples and a special creamy burger sauce, these Aloha Burgers are extra special and delicious!",
      imagePath: "lib/images/burgers/aloha_burger.jpg",
      price: 221.52,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 16.99),
        Addon(name: "Oninon", price: 13.99),
        Addon(name: "Avocado", price: 12.99),
      ],
    ),
    Food(
      name: "Jhakanaka Burger",
      description:
          "These BBQ Burgers are an amazingly juicy explosion of sweet, tangy, spicy, smokey, crispy deliciousness all at the same time.",
      imagePath: "lib/images/burgers/bbq_burger.jpg",
      price: 209.52,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 14.99),
        Addon(name: "Oninon", price: 13.99),
        Addon(name: "Avocado", price: 12.99),
      ],
    ),
    Food(
      name: "Faltu Burger",
      description:
          "Blue Moon Burgers uses premium PNW sourced beef to deliver the best tasting burger around.",
      imagePath: "lib/images/burgers/bluemoon_burger.jpeg",
      price: 253.52,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 14.99),
        Addon(name: "Oninon", price: 13.99),
        Addon(name: "Avocado", price: 12.99),
      ],
    ),
    Food(
      name: "Shei Burger",
      description:
          "A veggie burger or meatless burger is a hamburger made with a patty that does not contain meat, or the patty of such a hamburger. ",
      imagePath: "lib/images/burgers/vege_burger.jpg",
      price: 120.99,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 14.99),
        Addon(name: "Oninon", price: 13.99),
        Addon(name: "Avocado", price: 12.99),
      ],
    ),

    //salad
    Food(
      name: "Valo Salad",
      description:
          "This quinoa salad recipe is the best! Everyone loves this healthy quinoa salad made with quinoa, chickpeas, red bell pepper, cucumber, parsley and lemon.",
      imagePath: "lib/images/salads/quinoa_salad.jpeg",
      price: 99.99,
      category: FoodCategory.Salads,
      availableAddons: [
        Addon(name: "Yougart", price: 15.99),
        Addon(name: "Avocado", price: 13.99),
      ],
    ),
    Food(
      name: "Aro valo Salad",
      description:
          "This Asian Sesame Chicken Salad is a great way to secretly pack your family’s diet with a ton of vegetables. Hearty cabbage and greens are topped off with cooked chicken and crunchy almonds, then tossed in an Asian sesame ginger dressing.",
      imagePath: "lib/images/salads/asiansesame_salad.jpeg",
      price: 120.50,
      category: FoodCategory.Salads,
      availableAddons: [],
    ),
    Food(
      name: "Onk Valo Salad",
      description:
          "This classic Caesar salad recipe features crisp romaine, crunchy croutons, and Parmesan cheese. A creamy, tangy homemade dressing ties it together.",
      imagePath: "lib/images/salads/ceasar_salad.jpeg",
      price: 130.20,
      category: FoodCategory.Salads,
      availableAddons: [],
    ),
    Food(
      name: "Shei Salad",
      description:
          "This easy Greek salad recipe is our new favorite summer side dish! Just 7 ingredients + a simple Greek salad dressing make it refreshing & delicious.",
      imagePath: "lib/images/salads/greek_salad.jpeg",
      price: 140.20,
      category: FoodCategory.Salads,
      availableAddons: [],
    ),
    Food(
      name: "Matha Nosto Salad",
      description:
          "This Southwest Salad recipe has quickly become one of my most popular and most pinned recipes of all time.  It’s fresh, filling, flavorful, gluten-free and will have you actually CRAVING salad!",
      imagePath: "lib/images/salads/southwest_salad.jpg",
      price: 149.20,
      category: FoodCategory.Salads,
      availableAddons: [],
    ),

    // sides

    //deserts

    //drinks
  ];

  //user cart
  final List<CartItem> _cart = [];

  //delivery address (user based)
  String _deliveryAddress = "khaner mor, uttara";


  /*
  G E T T E R S
  */

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  /*
  O P R E R A T I O N S
  */

  // add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    // cart item same naki
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //food item same naki
      bool isSameFood = item.food == food;

      // addon same naki
      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    // item already thakle increase
    if (cartItem != null) {
      cartItem.quantity++;
    }

    // na thakle add hobe
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

  // total price of the cart
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

  //cart e total item
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

  //update delivery address
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  /*
  H E L P E R S
  */

  // generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here is your receipt.");
    receipt.writeln();

    // Date format Second porjonto update dibe
    String formattedDate =
      DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("------------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(
              cartItem.food.price)}"
      );
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt
            .writeln("  Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }

    receipt.writeln("--------------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItamCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering To: $deliveryAddress");


    return receipt.toString();
  }

  // money te convert
  String _formatPrice(double price) {
    return "Tk.${price.toStringAsFixed(2)}";
  }

  //addon string e convert
  String _formatAddons(List<Addon> addons) {
      return addons
          .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
          .join(", ");
  }
}
