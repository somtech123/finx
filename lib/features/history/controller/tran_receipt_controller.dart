import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranscationReceiptController extends GetxController {
  var tranId = TextEditingController(text: '4KJ8J8J3939G9');
  var recipientName = TextEditingController(text: 'Chiamaka Winifred');
  var description = TextEditingController(text: 'Groceries');
  var bankName = TextEditingController(text: 'Moniepoint Microfinance Bank');
  var accountNumber = TextEditingController(text: '123456789');
  var amount = TextEditingController(text: '₦5,000.00');
}
