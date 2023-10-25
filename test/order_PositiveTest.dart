import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Order creation test', (WidgetTester tester) async {
    // Define a test widget for the order creation scenario.
    final testWidget = MaterialApp(
      home: Scaffold(
        body:
            YourOrderWidget(), // Replace with your actual order creation widget.
      ),
    );

    await tester.pumpWidget(testWidget);

    // Verify that initial text is present.
    expect(find.text('Create Order'), findsOneWidget);

    // Simulate user interactions to create an order.
    await tester.tap(find.text('Create Order'));
    await tester.pump();

    // Verify that the order has been created.
    expect(find.text('Order Created'), findsOneWidget);
  });
}

class YourOrderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Create Order',
            style: TextStyle(fontSize: 18),
          ),
          ElevatedButton(
            onPressed: () {
              // Logic to create an order.
              // Replace with your actual order creation code.
              // For the test, we'll just show a confirmation message.
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Order Created'),
                    content: Text('Your order has been successfully created.'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('Create Order'),
          ),
        ],
      ),
    );
  }
}
