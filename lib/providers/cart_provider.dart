import 'package:flutter/foundation.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice =>
      _items.fold(0.0, (sum, item) => sum + item.product.price * item.quantity);

  void addItem(Product product, String size) {
    final index = _items.indexWhere(
      (item) => item.product.id == product.id && item.selectedSize == size,
    );

    if (index >= 0) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(product: product, selectedSize: size));
    }
    notifyListeners();
  }

  void removeItem(String productId, String size) {
    _items.removeWhere(
      (item) => item.product.id == productId && item.selectedSize == size,
    );
    notifyListeners();
  }

  void updateQuantity(String productId, String size, int quantity) {
    if (quantity <= 0) {
      removeItem(productId, size);
      return;
    }
    final index = _items.indexWhere(
      (item) => item.product.id == productId && item.selectedSize == size,
    );
    if (index >= 0) {
      _items[index].quantity = quantity;
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
