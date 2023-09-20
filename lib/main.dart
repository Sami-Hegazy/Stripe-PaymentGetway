import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stripe_payment/stripe_home.dart';
import 'package:stripe_payment/stripe_payment/stripe_keys.dart';

void main() {
  Stripe.publishableKey = ApiKeys.publishableKey;
  runApp(const StripeApp());
}

class StripeApp extends StatelessWidget {
  const StripeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Strip Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          primary: Colors.deepPurple,
          background: Colors.deepPurple.shade100,
        ),
        useMaterial3: true,
      ),
      home: const StripeHome(),
    );
  }
}
