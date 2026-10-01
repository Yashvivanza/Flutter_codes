import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:checkbox/main.dart';

void main() {
	testWidgets('radio buttons switch the selected gender', (WidgetTester tester) async {
		await tester.pumpWidget(const MyApp());

		final mobileField = tester.widget<TextField>(find.byWidgetPredicate(
			(widget) => widget is TextField && widget.decoration?.hintText == 'Mobile number',
		));
		final emailField = tester.widget<TextField>(find.byWidgetPredicate(
			(widget) => widget is TextField && widget.decoration?.hintText == 'Email address',
		));
		expect(mobileField.keyboardType, TextInputType.number);
		expect(mobileField.inputFormatters, contains(FilteringTextInputFormatter.digitsOnly));
		expect(emailField.keyboardType, TextInputType.emailAddress);

		RadioListTile<String> firstRadio() =>
				tester.widget<RadioListTile<String>>(find.byType(RadioListTile<String>).first);

		expect(firstRadio().groupValue, 'Male');
		await tester.tap(find.text('Female'));
		await tester.pump();
		expect(firstRadio().groupValue, 'Female');

		await tester.tap(find.text('Male'));
		await tester.pump();
		expect(firstRadio().groupValue, 'Male');
	});
}
