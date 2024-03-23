import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/new_orders/controllers/invoice_controller.dart';
import 'package:nuforce/app/modules/new_orders/widgets/agent_tile.dart';
import 'package:nuforce/app/utils/colors.dart';

class AvailableAgents extends StatelessWidget {
  const AvailableAgents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(
        color: AppColors.white1,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Available Agents',
                  style: TextStyle(
                    color: AppColors.nutralBlack1,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),
          const Divider(
            color: AppColors.white4,
            thickness: 1,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GetBuilder<InvoiceController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.agents.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: AgentTile(
                          onChanged: (v) {
                            controller.updateSelectedAgent(controller.agents[index]);
                          },
                          agent: controller.agents[index],
                          isSelected: controller.selectedAgent == controller.agents[index],
                          bgColor: index.isEven ? AppColors.agentCardBg1 : AppColors.agentCardBg2,
                          selectedAgent: controller.selectedAgent,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
