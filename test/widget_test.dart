import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:rashed_codebase/main.dart';
import 'package:rashed_codebase/providers/cart_provider.dart';

void main() {
  testWidgets('App launches and shows Fashion Hub', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => CartProvider(),
        child: const FashionHubApp(),
      ),
    );
    // Splash screen renders without error
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
