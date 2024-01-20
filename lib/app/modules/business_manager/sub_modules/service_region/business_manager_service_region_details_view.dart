import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/service_region/business_manager_add_or_edit_service_region.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/service_region/business_manager_service_region_controller.dart';
import 'package:nuforce/app/modules/service_items/widgets/title_subtitle_minimal_widget.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/main.dart';

class BusinessManagerServiceRegionDetailsView extends StatelessWidget {
  const BusinessManagerServiceRegionDetailsView({
    required this.serviceRegion,
    super.key,
  });
  final MockServiceRegion serviceRegion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarMinimal(title: 'Details'),
      body: SizedBox(
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
              TitleSubtitleMinimal(title: 'Type', subtitle: serviceRegion.type ?? 'N/A'),
              const SizedBox(height: 16),
              TitleSubtitleMinimal(title: 'Addr.', subtitle: serviceRegion.address ?? 'N/A'),
              const SizedBox(height: 16),
              TitleSubtitleMinimal(title: 'Dial Prefix', subtitle: serviceRegion.dialPrefix ?? 'N/A'),
              const SizedBox(height: 16),
              TitleSubtitleMinimal(title: 'Status', subtitle: serviceRegion.address ?? 'N/A'),
              const SizedBox(height: 32),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: SecondaryButton(
                      onPressed: () {
                        Get.back<void>();
                        final controller = Get.find<BusinessManagerController>();
                        controller.serviceRegionController.removeServiceRegion(serviceRegion);
                        Fluttertoast.showToast(msg: 'Service region Deleted');
                      },
                      text: 'Delete',
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: PrimaryButton(
                      onPressed: () {
                        Get
                          ..back<void>()
                          ..to<void>(() => BusinessManagerAddOrEditServiceRegion(serviceRegion: serviceRegion));
                      },
                      text: 'Edit',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
