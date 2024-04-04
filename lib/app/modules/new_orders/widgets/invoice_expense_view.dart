import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/new_orders/widgets/empty_expense_view.dart';
import 'package:nuforce/app/modules/settings/sub_modules/expense/controllers/add_new_expense_controller.dart';
import 'package:nuforce/app/modules/settings/sub_modules/expense/view/add_new_expanse.dart';
import 'package:nuforce/app/modules/settings/sub_modules/expense/view/expense_detail_screen.dart';
import 'package:nuforce/app/shared/widgets/details_with_header_skleton.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/datetime_custom_func.dart';
import 'package:nuforce/app/utils/extension_methods.dart';

class InvoiceExpenseView extends StatefulWidget {
  const InvoiceExpenseView({super.key});

  @override
  State<InvoiceExpenseView> createState() => _InvoiceExpenseViewState();
}

class _InvoiceExpenseViewState extends State<InvoiceExpenseView> {
  @override
  void initState() {
    super.initState();
    Get.put(AddNewExpenseController());
  }

  @override
  void dispose() {
    Get.delete<AddNewExpenseController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddNewExpenseController>(
      builder: (controller) {
        if (controller.expenses.isEmpty) {
          return const EmptyExpense();
        } else {
          return DetailsWithHeaderSkleton(
            controller: ExpandableController(),
            header: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Expenses',
                  style: TextStyle(
                    color: AppColors.nutralBlack1,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Icon(Icons.keyboard_arrow_down),
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  itemCount: controller.expenses.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    final expense = controller.expenses[index];
                    return InkWell(
                      onTap: () {
                        Get.to(() => ExpenseDetailScreen(expense: expense));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Text(
                              DatetimeCustomFunc.getDashedDate(expense.expireDate),
                              style: TextStyle(
                                color: AppColors.nutralBlack2,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            16.w.hSpace,
                            Expanded(
                              child: Text(
                                expense.name,
                                style: const TextStyle(
                                  color: AppColors.nutralBlack1,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '\$${expense.totalAmount}',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: AppColors.nutralBlack1,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.nutralBlack2,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                TextButton(
                  onPressed: () {
                    Get.to(() => const AddExpenseViewScreen());
                  },
                  child: Text(
                    '+ Add Expense',
                    style: TextStyle(
                      color: AppColors.primaryBlue1,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
