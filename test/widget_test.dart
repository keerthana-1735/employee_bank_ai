import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:employee_bank_ai/main.dart';

void main() {
  testWidgets('App loads successfully', (WidgetTester tester) async {
    // Build our app
    await tester.pumpWidget(const MyApp());

    // Verify that our app starts (look for key widgets from login screen)
    await tester.pumpAndSettle(); // Wait for animations/async operations
    
    // Check for elements from your login screen
    expect(find.text('Employee Banking'), findsOneWidget);
    expect(find.text('Secure login for bank employees'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2)); // Employee ID and Password
    expect(find.text('LOGIN'), findsOneWidget);
  });

  testWidgets('Login form validation works', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
    
    // Try to login without entering credentials
    await tester.tap(find.text('LOGIN'));
    await tester.pump();
    
    // Should show validation errors (if your app has proper validation)
    expect(find.text('Please enter your Employee ID'), findsOneWidget);
  });
}