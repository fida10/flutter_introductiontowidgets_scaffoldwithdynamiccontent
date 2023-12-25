import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:introductiontowidgets_scaffoldwithdynamiccontent/main.dart';

void main() {
  testWidgets('Scaffold content changes based on dropdown selection',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: YourDynamicScreen()));

    // Check initial state
    expect(find.text('Initial Content'), findsOneWidget);

    // Change dropdown value
    await tester.tap(find.byType(DropdownButton<String>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Option 1').last);
    await tester.pumpAndSettle();

    // Check for updated content
    expect(find.text('Content for Option 1'), findsOneWidget);
  });
}
