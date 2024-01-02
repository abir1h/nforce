// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/settings/models/card.dart';
import 'package:nuforce/app/modules/settings/models/user_info.dart';

class SubscriptionController extends GetxController {
  UserInfo? userInfo;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController businessName = TextEditingController();
  TextEditingController businessDomain = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController contactUs = TextEditingController();
  TextEditingController helpEmail = TextEditingController();

  bool? triggerValue = false;

  void trigger(bool value) {
    triggerValue = value;
    update();
  }

  List<String> data = [
    'Service Center ',
    'Contacts',
    'Service Manager',
    'Human Resource',
    'Accounting',
  ];

  List<Card> cardList = [
    Card(
      cardId: 1,
      cardHolderName: 'Abir Rahman',
      cardNumber: '12342424252442546',
      cvv: 123,
      mmYy: '08/28',
    ),
    Card(
      cardId: 2,
      cardHolderName: 'Shadat Rahman',
      cardNumber: '1234242425276532435',
      cvv: 123,
      mmYy: '08/28',
    ),
    Card(
      cardId: 3,
      cardHolderName: 'Rayhan Islam',
      cardNumber: '123424242529876546',
      cvv: 123,
      mmYy: '08/28',
    ),
  ];

  void save(UserInfo data) {
    userInfo = data;
    update();
  }

  String obscureCardNumber(String cardNumber) {
    if (cardNumber.length >= 16) {
      const obscuredPart = '**** **** ';
      final lastFourDigits = cardNumber.substring(12);
      return '$obscuredPart$lastFourDigits';
    } else {
      return cardNumber; // Return the original number if it doesn't have enough digits.
    }
  }

  final count = 0.obs;

  void increment() => count.value++;
}
