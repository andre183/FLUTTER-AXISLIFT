import 'package:http/http.dart' as http;
import 'dart:convert';

class PaymentService {
  static const String _baseUrl = 'https://api.example.com/payments'; // Replace with actual payment gateway API

  Future<void> chargeRetainer(double amount) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/charge'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'amount': amount,
        'currency': 'ZAR',
        'description': 'AxisLift Ride Retainer',
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to process payment');
    }
  }
}