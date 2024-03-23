import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/new_orders/controllers/invoice_controller.dart';
import 'package:nuforce/app/modules/new_orders/widgets/available_agents.dart';
import 'package:nuforce/app/shared/widgets/colored_button.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';

class Agents extends StatefulWidget {
  const Agents({
    super.key,
  });

  @override
  State<Agents> createState() => _AgentsState();
}

class _AgentsState extends State<Agents> {
  // final controller = Get.find<InvoiceController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InvoiceController>(
      builder: (controller) {
        if (controller.selectedAgent == null) {
          return ColoredButton(
            text: '+ Add Agents',
            textColor: AppColors.primaryBlue1,
            onTap: () async {
              await _availableAgentsBottomSheet(context);
            },
          );
        } else {
          return GestureDetector(
            onTap: () async {
              await _availableAgentsBottomSheet(context);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                color: controller.selectedAgent!.color,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(controller.selectedAgent!.image),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.selectedAgent!.name,
                        style: TextStyle(
                          color: AppColors.nutralBlack1,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        controller.selectedAgent!.status,
                        style: TextStyle(
                          color: AppColors.nutralBlack2,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Future<dynamic> _availableAgentsBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            children: [
              const Expanded(child: AvailableAgents()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
                child: PrimaryButton(
                  onPressed: () {
                    Get.back();
                  },
                  text: 'Assign',
                ),
              ),
              10.h.vSpace,
            ],
          ),
        );
      },
    );
  }
}
