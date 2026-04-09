import 'package:flutter_test/flutter_test.dart';
import 'package:skinseek_app/app.dart';

void main() {
  testWidgets('Landing screen smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const SkinSeekApp());

    // Verify that the landing screen tagline is present.
    expect(find.text('Understand your skin like never before.'), findsOneWidget);
    expect(find.text('Get Started'), findsOneWidget);
  });
}
