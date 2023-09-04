import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/home/components/invoice_status_matrics.dart';
import 'package:nuforce/app/modules/home/components/invoice_tile.dart';
import 'package:nuforce/app/modules/home/controllers/home_controller.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/main.dart';

class InvoiceBody extends GetView<HomeController> {
  const InvoiceBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Expanded(
                  child: InvoiceStatusMatrics(
                    color: AppColors.yellow,
                    status: 'Pending',
                    topValue: '90',
                    amount: '15',
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: InvoiceStatusMatrics(
                    color: AppColors.primaryBlue2,
                    status: 'Pending',
                    topValue: '90',
                    amount: '15',
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: InvoiceStatusMatrics(
                    color: AppColors.green,
                    status: 'Pending',
                    topValue: '90',
                    amount: '15',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'All Invoices',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.nutralBlack1,
                  ),
                ),
                Container(
                  height: 30,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: AppColors.textFieldBackground,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: AppColors.inactiveColor),
                  ),
                  child: DropdownButton(
                    underline: const SizedBox(),
                    isExpanded: false,
                    icon: const Icon(Icons.arrow_drop_down, color: AppColors.inactiveColor),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.subText,
                    ),
                    items: ['All', 'Last 7 Days', 'Last 30 Days']
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.subText,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    value: 'All',
                    onChanged: (newValue) {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InvoiceTile(
                    isHighlighted: index % 2 == 0,
                    title: 'AC fixing',
                    price: '100.50',
                    name: 'Abu Bokkor',
                    invoiceDate: '20 Jun, 2023',
                    status: index % 2 != 0 ? 'Pending' : 'Paid',
                    statusColor: index % 2 != 0 ? AppColors.orange : AppColors.green,
                  ),
                );
              },
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
