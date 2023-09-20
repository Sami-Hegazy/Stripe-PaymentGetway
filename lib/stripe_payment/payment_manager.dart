import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stripe_payment/stripe_payment/stripe_keys.dart';

abstract class PaymentManager {
  static Future<void> makePayment(
      {required int amount, required String currency}) async {
    try {
      String clientSecret = await _getClientSecret(
          amount: (amount * 100).toString(), currency: currency);
      await _initializePaymentSheet(clientSecret: clientSecret);
      await Stripe.instance.presentPaymentSheet();
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  static Future<void> _initializePaymentSheet(
      {required String clientSecret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: 'sami',
      ),
    );
  }

  static Future<String> _getClientSecret(
      {required String amount, required String currency}) async {
    Dio dio = Dio();
    var response = await dio.post(
      'https://api.stripe.com/v1/payment_intents',
      options: Options(headers: {
        'Authorization': 'Bearer ${ApiKeys.secretKey}',
        'Content-Type': 'application/x-www-form-urlencoded',
      }),
      data: {'amount': amount, 'currency': currency},
    );
    return response.data['client_secret'];
  }
}
