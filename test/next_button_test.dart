import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:phone_number_input_fromscratch/controllers/button_active_controller.dart';
import 'package:phone_number_input_fromscratch/controllers/hint_opacity_controller.dart';
import 'package:phone_number_input_fromscratch/controllers/telephone_number_result_controller.dart';
import 'package:phone_number_input_fromscratch/controllers/text_controllers.dart';
import 'package:phone_number_input_fromscratch/main.dart';
import 'package:phone_number_input_fromscratch/pages/detail_page/call_page.dart';
import 'package:phone_number_input_fromscratch/widgets/buttons/next_button.dart';
import 'package:provider/provider.dart';

void main() {
  late ButtonActiveController buttonActiveController;
  late TextControllers textControllers;
  late HintOpacityController hintOpacityController;

  setUp(() {
    buttonActiveController = ButtonActiveController();
    textControllers = TextControllers();
    hintOpacityController = HintOpacityController();
  });

  Widget createWidgetForTesting(Widget child) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TelephoneNumberResultController()),
        ChangeNotifierProvider(create: (_) => buttonActiveController),
        ChangeNotifierProvider(create: (_) => textControllers),
        ChangeNotifierProvider(create: (_) => hintOpacityController),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        home: Scaffold(
          body: child,
        ),
      ),
    );
  }

  testWidgets('NextButton renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(const NextButton()));

    expect(find.byType(InkWell), findsOneWidget);
    expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
  });

  testWidgets('NextButton is disabled when inactive', (WidgetTester tester) async {
    // Ensure button is inactive
    buttonActiveController.changeButtonActive(false);
    await tester.pumpWidget(createWidgetForTesting(const NextButton()));
    await tester.pump(); // Trigger rebuild after state change

    final inkWell = tester.widget<InkWell>(find.byType(InkWell));
    expect(inkWell.onTap, isNull); // Button should be disabled
  });

  testWidgets('NextButton is enabled when active', (WidgetTester tester) async {
    // Activate the button
    buttonActiveController.changeButtonActive(true);
    await tester.pumpWidget(createWidgetForTesting(const NextButton()));
    await tester.pump(); // Trigger rebuild after state change

    final inkWell = tester.widget<InkWell>(find.byType(InkWell));
    expect(inkWell.onTap, isNotNull); // Button should be enabled
  });

  testWidgets('NextButton navigates to CallPage on tap', (WidgetTester tester) async {
    // Activate the button
    buttonActiveController.changeButtonActive(true);
    await tester.pumpWidget(createWidgetForTesting(const NextButton()));
    await tester.pump(); // Ensure widget is built

    // Tap the button
    await tester.tap(find.byType(InkWell));
    await tester.pump(); // Start the tap handling
    await tester.pumpAndSettle(); // Wait for navigation animation to complete

    // Advance time by 1 second to allow Future.delayed to complete
    await tester.pump(const Duration(seconds: 1));
    await tester.pumpAndSettle(); // Process any resulting state changes

    // Verify navigation to CallPage
    expect(find.byType(CallPage), findsOneWidget);
  });
}
