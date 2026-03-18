// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:test1/main.dart';

void main() {
  testWidgets('Dashboard loads and shows stats', (WidgetTester tester) async {
    // Build app and let async dashboard data load.
    await tester.pumpWidget(ProviderScope(child: MyApp()));
    await tester.pump(const Duration(seconds: 2));

    expect(find.text('Statistics'), findsOneWidget);
    expect(find.text('Total Mahasiswa'), findsOneWidget);
    expect(find.text('Mahasiswa Aktif'), findsOneWidget);
  });
}
