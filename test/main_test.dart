import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tradeswift/Screens/HomeScreen.dart';
import 'package:tradeswift/main.dart';

void main() {
  testWidgets('MyApp Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Stock Scan Parser'), findsOneWidget);
  });

  testWidgets('MyHomePage Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: MyHomePage(title: 'Stock Scan Parser'),
    ));

    expect(find.text('Stock Scan Parser'), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(HomePage), findsOneWidget);
  });
}
