import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_service_region_controller.dart';
import 'package:nuforce/app/modules/business_manager/controllers/service_region_edit_controller.dart';
import 'package:nuforce/app/modules/business_manager/models/service_region_model.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/services/business_manager_calendar_api_services.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/service_region/business_manager_add_or_edit_service_region.dart';
import 'package:nuforce/app/modules/service_items/widgets/title_subtitle_minimal_widget.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_dialog.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/custom_loading_widget.dart';
import 'package:nuforce/main.dart';

class BusinessManagerServiceRegionDetailsView extends StatelessWidget {
  const BusinessManagerServiceRegionDetailsView({
    required this.serviceRegion,
    super.key,
  });
  final ServiceRegionModel serviceRegion;

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(ServiceRegionEditController());
    return Scaffold(
      appBar: const CustomAppbarMinimal(title: 'Details'),
      body: GetBuilder<ServiceRegionEditController>(builder: (controller) {
        return CustomLoadingWidget(
          isLoading: controller.isLoading,
          child: SizedBox(
            height: height,
            width: width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  TitleSubtitleMinimal(title: 'Name', subtitle: serviceRegion.name),
                  const SizedBox(height: 16),
                  TitleSubtitleMinimal(title: 'Group Code', subtitle: serviceRegion.groupCode),
                  const SizedBox(height: 16),
                  TitleSubtitleMinimal(title: 'ParamsorgCode.', subtitle: serviceRegion.paramsOrgCode),
                  const SizedBox(height: 16),
                  const SizedBox(height: 32),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: SecondaryButton(
                          onPressed: () async {
                            showDialog(
                              context: context,
                              builder: (ctx) {
                                return CustomDialog(
                                  dialogType: DialogType.warning,
                                  title: 'Delete Service Region?',
                                  content: 'Are you sure you want to delete ${serviceRegion.name}?',
                                  primaryText: 'Delete',
                                  onPrimaryButtonPress: () async {
                                    Navigator.of(ctx).pop();
                                    await controller.addRegion(id: serviceRegion.id, action: ActionType.delete).then((value) {
                                      if (value ?? false) {
                                        final controllerRegion= Get.find<BusinessManagerServiceRegionController>();
                                        controllerRegion.getRegions();
                                        Get.back<void>();
                                      }
                                    });
                                  },
                                  secondaryText: 'Cancel',
                                  onSecondaryButtonPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                );
                              },
                            );
                          },
                          text: 'Delete',
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: PrimaryButton(
                          onPressed: () async {
                            final controller = Get.find<ServiceRegionEditController>();
                            await controller.setRegionForm(serviceRegion.id);
                            Get
                              ..back<void>()
                              ..to<void>(() => BusinessManagerAddOrEditServiceRegion(serviceRegion: serviceRegion));
                          },
                          text: 'Edit',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
