import 'package:flutter/material.dart';
import 'package:stripe_payment/stripe_payment/payment_manager.dart';

class StripeHome extends StatelessWidget {
  const StripeHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: Padding(
              padding: EdgeInsets.only(bottom: 26),
              child: Text(
                'Stripe Payment Home',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          backgroundColor: Colors.deepPurple,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              const Text(
                '20 \$',
                style: TextStyle(color: Colors.deepPurple),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  PaymentManager.makePayment(amount: 20, currency: 'EGP');
                },
                style: const ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(
                    Size(100, 35),
                  ),
                ),
                child: const Text('Buy'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
