import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:pay_with_stripe/pay_with_stripe.dart';

Future<void> stripePayment({
  required BuildContext context,
  required String secretKey,
  required String publishableKey,
  required String customId,
  required num amount,
  String? customerName,
  String? merchantDisplayName,
  bool saveCard = false,
  CURRENCY currency = CURRENCY.usd,
  ThemeMode? style,
}) async {
  try {
    final result = await PayWithStripe.makePayment(
      paymentModel: PaymentModel(
        publishableKey: publishableKey,
        secretKey: secretKey,
        amount: amount,
        customId: customId,
        saveCard: saveCard,
        currency: currency,
        merchantDisplayName: merchantDisplayName ?? "Default Merchant",
        style: style,
      ),
    );

    log('Payment Result: ${result.toString()}');

    if (result['error'] == true) {
      final errorMessage = result['data']['message'] ?? 'Payment failed';
      log('Payment failed: $errorMessage');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage), backgroundColor: Colors.red),
      );

      // Navigator.pop(context);

      return;
    }

    await PayWithStripe.createCustomer(
      customerModel: CustomerModel(
        secretKey: secretKey,
        customerId: customId,
        customerName: customerName ?? "Default Customer",
      ),
    );

    log('Payment successful!');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Payment successful!'),
        backgroundColor: Colors.green,
      ),
    );
  } catch (e) {
    log('Error: $e');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('An error occurred: $e'),
        backgroundColor: Colors.red,
      ),
    );
  }
}
