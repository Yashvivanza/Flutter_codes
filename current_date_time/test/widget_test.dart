import 'package:flutter_test/flutter_test.dart';

import 'package:current_date_time/main.dart';

void main() {
  testWidgets('shows the current date and time', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Current date and time'), findsOneWidget);
    expect(find.textContaining('Date: '), findsOneWidget);
    expect(find.textContaining('Time: '), findsOneWidget);
  });
}
