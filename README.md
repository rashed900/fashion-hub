# Fashion Hub

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.


## 4 Implemented Features (Assessment requirement)
1. **Home Screen** — product grid, category filter tabs (Jackets, Suits, Accessories, etc.), search bar
2. **Product Detail Screen** — image, name, price, size selector, Add to Cart button
3. **Cart Screen** — list of added items, quantity controls, total price, Checkout button
4. **Order Tracking Screen** — order status steps (Placed → Confirmed → Shipped → Delivered), estimated date

## Screens / Navigation Structure
```
SplashScreen
  └── HomeScreen (BottomNav: Home | Wishlist | Cart | Profile)
        ├── ProductDetailScreen (pushed on product tap)
        ├── CartScreen (BottomNav tab)
        ├── OrderTrackingScreen (accessible from Cart after "Checkout")
        └── ProfileScreen (BottomNav tab, basic static UI)
```

## Folder Structure
```
lib/
  main.dart
  screens/
    splash_screen.dart
    home_screen.dart
    product_detail_screen.dart
    cart_screen.dart
    order_tracking_screen.dart
    profile_screen.dart
  widgets/
    product_card.dart
    category_chip.dart
    cart_item_tile.dart
    bottom_nav_bar.dart
  models/
    product.dart
    cart_item.dart
  data/
    products_data.dart
  utils/
    app_theme.dart
    app_colors.dart
```


A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
