class PaymentMethodModel {
  final PaymentMethodType paymentMethodType;
  final String paymentMethodSvgIcon;
  final String? cardNumber;
  final String amount;
  final DateTime date;
  final DateTime dueDate;
  final String remainingAmount;
  final String paymentTerm;

  PaymentMethodModel({
    required this.paymentMethodType,
    required this.paymentMethodSvgIcon,
    required this.cardNumber,
    required this.amount,
    required this.date,
    required this.dueDate,
    required this.remainingAmount,
    required this.paymentTerm,
  });
}

enum PaymentMethodType {
  card,
  cash,
  check,
  stripe,
  nuForcePay,
  worldPay,
}
