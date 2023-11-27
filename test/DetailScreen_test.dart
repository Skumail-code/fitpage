import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tradeswift/Screens/DetailsScreen.dart';

void main() {
  testWidgets('DetailScreen widget test', (WidgetTester tester) async {
    final Map<String, dynamic> mockItem = {
      'name': 'Mock Name',
      'tag': 'Mock Tag',
      'color': 'green',
      'criteria': [
        {
          'type': 'variable',
          'text': 'Variable Criteria \$variableName',
          'variable': {'variableName': 'Variable Details'},
        },
      ],
    };

    await tester.pumpWidget(
      MaterialApp(
        home: DetailScreen(item: mockItem),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Mock Name'), findsOneWidget);
    expect(find.text('Mock Tag'), findsOneWidget);
    expect(find.text('Variable Criteria \$variableName'), findsOneWidget);
  });
}
