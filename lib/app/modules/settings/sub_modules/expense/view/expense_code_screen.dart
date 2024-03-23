import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../shared/widgets/custom_appbar_minimal.dart';
import '../../../../../utils/colors.dart';
import '../../../../../utils/text_styles.dart';
import 'add_expense_code_screen.dart';

class ExpenseCodeScreen extends StatefulWidget {
  const ExpenseCodeScreen({super.key});

  @override
  State<ExpenseCodeScreen> createState() => _ExpenseCodeScreenState();
}

class _ExpenseCodeScreenState extends State<ExpenseCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      resizeToAvoidBottomInset: true,
  /*    floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Row(
          children: [
            Expanded(
              child: SecondaryButton(
                onPressed: () {},
                text: 'Decline',
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: PrimaryButton(
                onPressed: () {
                  Get.to<void>(() => const ExpenseView());
                },
                text: 'Approve',
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,*/
      appBar: CustomAppbarMinimal(
        title: 'Expense Code List',
        trailing: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: GestureDetector(
              onTap: () => Get.to<void>(() => const AddExpenseCodeViewScreen()),
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    size: 24.r,
                    color: AppColors.nutralBlack1,
                  ),
                  Text(
                    'Add',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: AppColors.nutralBlack1,
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          width: 1.sw,
          child: DataTable(
            dividerThickness: 2,border: TableBorder.all(color: AppColors.tableBorder),
            headingTextStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 14.sp,color: AppColors.nutralBlack1),

            columns: const [
              DataColumn(label: Text('Code')),
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Amount')),
            ],
            rows: const [
              DataRow(cells: [
                DataCell(Text('AP0201')),
                DataCell(Text('Electric Bill')),
                DataCell(Text(r'$5000')),
              ],), DataRow(cells: [
                DataCell(Text('AP0202')),
                DataCell(Text('Gas Bill')),
                DataCell(Text(r'$5000')),
              ],), DataRow(cells: [
                DataCell(Text('AP0202')),
                DataCell(Text('Gas Bill')),
                DataCell(Text(r'$5000')),
              ],), DataRow(cells: [
                DataCell(Text('AP0202')),
                DataCell(Text('Gas Bill')),
                DataCell(Text(r'$5000')),
              ],), DataRow(cells: [
                DataCell(Text('AP0202')),
                DataCell(Text('Gas Bill')),
                DataCell(Text(r'$5000')),
              ],), DataRow(cells: [
                DataCell(Text('AP0202')),
                DataCell(Text('Gas Bill')),
                DataCell(Text(r'$5000')),
              ],), DataRow(cells: [
                DataCell(Text('AP0202')),
                DataCell(Text('Gas Bill')),
                DataCell(Text(r'$5000')),
              ],), DataRow(cells: [
                DataCell(Text('AP0202')),
                DataCell(Text('Gas Bill')),
                DataCell(Text(r'$5000')),
              ],), DataRow(cells: [
                DataCell(Text('AP0202')),
                DataCell(Text('Gas Bill')),
                DataCell(Text(r'$5000')),
              ],), DataRow(cells: [
                DataCell(Text('AP0202')),
                DataCell(Text('Gas Bill')),
                DataCell(Text(r'$5000')),
              ],), DataRow(cells: [
                DataCell(Text('AP0202')),
                DataCell(Text('Gas Bill')),
                DataCell(Text(r'$5000')),
              ],),
              DataRow(
                cells: [
                  DataCell(Text('002')),
                  DataCell(Text('Product 2')),
                  DataCell(Text('150')),
                ],
              ),
              // Add more rows as needed
            ],
          ),
        ),
      ),
    );
  }

  List<PopupMenuEntry<int>> popupMenuItems = [
    PopupMenuItem<int>(
      value: 1,
      child: Text(
        'Pending',
        style: CustomTextStyle.paragraphExtraSmall.copyWith(
          color: AppColors.subText,
        ),
      ),
    ),
    PopupMenuItem<int>(
      value: 2,
      child: Text(
        'Processing',
        style: CustomTextStyle.paragraphExtraSmall.copyWith(
          color: AppColors.subText,
        ),
      ),
    ),
    PopupMenuItem<int>(
      value: 3,
      child: Text(
        'Complete',
        style: CustomTextStyle.paragraphExtraSmall.copyWith(
          color: AppColors.subText,
        ),
      ),
    ),
    PopupMenuItem<int>(
      value: 4,
      child: Text(
        'Cancelled',
        style: CustomTextStyle.paragraphExtraSmall.copyWith(
          color: AppColors.subText,
        ),
      ),
    ),
  ];
}
