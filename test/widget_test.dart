import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/main.dart';

void main() {
  testWidgets('App renders', (WidgetTester tester) async {
    await tester.pumpWidget(const BinaryJazzApp());
    expect(find.text('CodedByKay'), findsOneWidget);
  });
}
