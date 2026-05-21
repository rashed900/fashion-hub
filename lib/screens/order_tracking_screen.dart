import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';

enum _StepStatus { done, active, pending }

class _OrderStep {
  final String title;
  final String subtitle;
  final _StepStatus status;

  const _OrderStep(this.title, this.subtitle, this.status);
}

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  static const _steps = [
    _OrderStep(
      'Order Placed',
      'May 21, 2026 at 10:30 AM',
      _StepStatus.done,
    ),
    _OrderStep(
      'Order Confirmed',
      'May 21, 2026 at 11:05 AM',
      _StepStatus.done,
    ),
    _OrderStep(
      'Shipped',
      'May 22, 2026 — Package in transit',
      _StepStatus.active,
    ),
    _OrderStep(
      'Out for Delivery',
      'Estimated May 25, 2026',
      _StepStatus.pending,
    ),
    _OrderStep(
      'Delivered',
      'Estimated May 26, 2026',
      _StepStatus.pending,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Order Tracking')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildOrderHeader(),
            const SizedBox(height: 16),
            _buildSectionCard(
              title: 'Tracking Progress',
              child: _buildStepper(),
            ),
            const SizedBox(height: 16),
            _buildSectionCard(
              title: 'Shipping Address',
              child: _buildShippingAddress(),
            ),
            const SizedBox(height: 16),
            _buildSectionCard(
              title: 'Items in this Order',
              child: _buildItemSummary(),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.darkNavy,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order #FH-20489',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Shipped',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Estimated Delivery: May 26, 2026',
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }

  Widget _buildStepper() {
    return Column(
      children: _steps.asMap().entries.map((entry) {
        return _buildStep(entry.value, isLast: entry.key == _steps.length - 1);
      }).toList(),
    );
  }

  Widget _buildStep(_OrderStep step, {required bool isLast}) {
    final isDone = step.status == _StepStatus.done;
    final isActive = step.status == _StepStatus.active;
    final isCompleted = isDone || isActive;

    const circleSize = 28.0;
    const lineHeight = 44.0;

    final circleDecoration = BoxDecoration(
      shape: BoxShape.circle,
      color: isCompleted ? AppColors.primary : Colors.transparent,
      border: Border.all(
        color: isCompleted ? AppColors.primary : Colors.grey.shade300,
        width: 2,
      ),
      boxShadow: isActive
          ? [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.35),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ]
          : null,
    );

    IconData? circleIcon;
    if (isDone) circleIcon = Icons.check_rounded;
    if (isActive) circleIcon = Icons.local_shipping_outlined;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline column
        Column(
          children: [
            Container(
              width: circleSize,
              height: circleSize,
              decoration: circleDecoration,
              child: circleIcon != null
                  ? Icon(circleIcon, size: 15, color: Colors.white)
                  : null,
            ),
            if (!isLast)
              Container(
                width: 2,
                height: lineHeight,
                margin: const EdgeInsets.symmetric(vertical: 2),
                color: isDone ? AppColors.primary : Colors.grey.shade200,
              ),
          ],
        ),
        const SizedBox(width: 14),
        // Content column
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                step.title,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: isCompleted ? FontWeight.w600 : FontWeight.w400,
                  color: isCompleted ? AppColors.textPrimary : AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                step.subtitle,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
              if (!isLast) const SizedBox(height: lineHeight - 8),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildShippingAddress() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.location_on_outlined, color: AppColors.primary, size: 22),
        ),
        const SizedBox(width: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '123 Main Street',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            Text(
              'Sydney NSW 2000, Australia',
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildItemSummary() {
    final items = [
      ('Classic Leather Jacket', 'Size: M', '\$89.99'),
      ('Slim Fit Navy Suit', 'Size: L', '\$119.99'),
    ];

    return Column(
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  item.$1,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              Text(
                item.$2,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                item.$3,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
