import 'package:flutter_test/flutter_test.dart';
import 'package:flow_points/main.dart';

void main() {
  testWidgets('FlowPointsApp builds', (WidgetTester tester) async {
    await tester.pumpWidget(const FlowPointsApp());
    await tester.pump(); // laisse le temps au 1er frame

    // Smoke test : l'app se lance sans crash
    expect(find.byType(FlowPointsApp), findsOneWidget);
  });
}
