import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../utils/app_colors.dart';
import '../widgets/cart_item_tile.dart';
import 'order_tracking_screen.dart';

class CartScreen extends StatelessWidget {
  final VoidCallback? onContinueShopping;

  const CartScreen({super.key, this.onContinueShopping});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cart, _) {
        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            title: Text(
              cart.items.isEmpty ? 'Cart' : 'Cart (${cart.itemCount})',
            ),
          ),
          body: cart.items.isEmpty
              ? _buildEmptyCart(context)
              : _buildCartContent(context, cart),
        );
      },
    );
  }

  Widget _buildEmptyCart(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.shopping_bag_outlined,
            size: 80,
            color: AppColors.textSecondary.withValues(alpha: 0.35),
          ),
          const SizedBox(height: 18),
          Text(
            'Your cart is empty',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Add some items to get started',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 28),
          ElevatedButton(
            onPressed: () {
              if (onContinueShopping != null) {
                onContinueShopping!();
              } else {
                Navigator.of(context).maybePop();
              }
            },
            child: const Text('Continue Shopping'),
          ),
        ],
      ),
    );
  }

  Widget _buildCartContent(BuildContext context, CartProvider cart) {
    final subtotal = cart.totalPrice;
    final shipping = subtotal >= 50.0 ? 0.0 : 5.99;
    final total = subtotal + shipping;

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            itemCount: cart.items.length,
            itemBuilder: (context, index) =>
                CartItemTile(item: cart.items[index]),
          ),
        ),
        _buildOrderSummary(context, subtotal, shipping, total, cart),
      ],
    );
  }

  Widget _buildOrderSummary(
    BuildContext context,
    double subtotal,
    double shipping,
    double total,
    CartProvider cart,
  ) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 28),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Summary',
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          _summaryRow(
            'Subtotal',
            '\$${subtotal.toStringAsFixed(2)}',
          ),
          const SizedBox(height: 6),
          _summaryRow(
            'Shipping',
            shipping == 0.0 ? 'FREE' : '\$${shipping.toStringAsFixed(2)}',
            valueColor: shipping == 0.0 ? Colors.green.shade600 : null,
            hint: subtotal < 50.0 ? 'Free over \$50' : null,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(height: 1),
          ),
          _summaryRow(
            'Total',
            '\$${total.toStringAsFixed(2)}',
            bold: true,
            fontSize: 16,
          ),
          const SizedBox(height: 18),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                cart.clearCart();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const OrderTrackingScreen(),
                  ),
                );
              },
              child: const Text('Proceed to Checkout'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _summaryRow(
    String label,
    String value, {
    bool bold = false,
    double fontSize = 14,
    Color? valueColor,
    String? hint,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: fontSize,
                fontWeight: bold ? FontWeight.w700 : FontWeight.w400,
                color: AppColors.textPrimary,
              ),
            ),
            if (hint != null)
              Text(
                hint,
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  color: AppColors.textSecondary,
                ),
              ),
          ],
        ),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: fontSize,
            fontWeight: bold ? FontWeight.w700 : FontWeight.w500,
            color: valueColor ?? (bold ? AppColors.textPrimary : AppColors.textSecondary),
          ),
        ),
      ],
    );
  }
}
