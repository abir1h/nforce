import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddNewExpenseController extends GetxController {
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  void setLoaded(bool value) {
    _isLoaded = value;
    update();
  }

  final List<MockExpense> _expenses = [];
  List<MockExpense> get expenses => _expenses;

  Future<bool> addExpense(MockExpense expense) async {
    _expenses.add(expense);
    update();
    return true;
  }

  Future<bool> removeExpenseAt(int index) async {
    _expenses.removeAt(index);
    update();
    return true;
  }
}

class MockExpense {
  final String expenseCode;
  final String name;
  final String spendBy;
  final DateTime expireDate;
  final Duration duration;
  final String totalAmount;
  final String fundSource;
  final String details;
  final String reimbursable;
  final List<XFile> images;

  MockExpense({
    required this.expenseCode,
    required this.name,
    required this.spendBy,
    required this.expireDate,
    required this.duration,
    required this.totalAmount,
    required this.fundSource,
    required this.details,
    required this.reimbursable,
    required this.images,
  });
}
