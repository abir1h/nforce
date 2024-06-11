import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_service_category_controller.dart';
import 'package:nuforce/app/modules/business_manager/controllers/service_category_edit_controller.dart';
import 'package:nuforce/app/modules/business_manager/models/service_category_model.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/services/business_manager_calendar_api_services.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/service_category/business_manager_add_or_edit_service_category.dart';
import 'package:nuforce/app/modules/service_items/widgets/title_subtitle_minimal_widget.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_dialog.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/custom_loading_widget.dart';
import 'package:nuforce/main.dart';

class BusinessManagerServiceCategoryDeatilsView extends StatelessWidget {
  const BusinessManagerServiceCategoryDeatilsView({
    required this.serviceCategory,
    super.key,
  });
  final ServiceCategoryModel serviceCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarMinimal(title: 'Details'),
      body: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.horizontalPadding),
          child: GetBuilder<ServiceCategoryEditController>(
            builder: (controller) {
              return CustomLoadingWidget(
                isLoading: controller.isLoading,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    TitleSubtitleMinimal(
                        title: 'Name', subtitle: serviceCategory.slug),
                    const SizedBox(height: 16),
                    TitleSubtitleMinimal(
                        title: 'Ref Code', subtitle: serviceCategory.refCode),
                    const SizedBox(height: 16),
                    // TitleSubtitleMinimal(title: 'Parent Category', subtitle: serviceCategory.parentCategory),
                    //const SizedBox(height: 16),
                    TitleSubtitleMinimal(
                        title: 'breadcrumbs',
                        subtitle: serviceCategory.breadcrumbs),
                    const SizedBox(height: 16),
                    /*     TitleSubtitleMinimal(title: 'Display Order', subtitle: serviceCategory.displayOrder),
                    const SizedBox(height: 16),
                    TitleSubtitleMinimal(title: 'Terms and Policies', subtitle: serviceCategory.termsAndConditions),
                    const SizedBox(height: 16),
                    TitleSubtitleMinimal(title: 'Tags', subtitle: serviceCategory.tags),
                    const SizedBox(height: 16),
                    TitleSubtitleMinimal(title: 'Description', subtitle: serviceCategory.description),*/
                    const SizedBox(height: 32),
                    const Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: SecondaryButton(
                            onPressed: () {
                              /* Get.back<void>();
                              final controller = Get.find<BusinessManagerController>();
                              controller.serviceCatalogsController.removeServiceCatalog(serviceCategory);
                              Fluttertoast.showToast(msg: 'Service Catalog Deleted');*/
                              showDialog(
                                context: context,
                                builder: (ctx) {
                                  return CustomDialog(
                                    dialogType: DialogType.warning,
                                    title: 'Delete Category?',
                                    content:
                                        'Are you sure you want to delete ${serviceCategory.slug}?',
                                    primaryText: 'Delete',
                                    onPrimaryButtonPress: () async {
                                      Navigator.of(ctx).pop();
                                      final controller = Get.find<
                                          ServiceCategoryEditController>();
                                      controller
                                          .addEditOrDeleteCategory(
                                        action: ActionType.delete,
                                        id: serviceCategory.id,
                                      )
                                          .then((value) {
                                        if (value) {
                                          final controllerCategory = Get.find<
                                              BusinessManagerServiceCategoryController>();
                                          controllerCategory
                                              .getServiceCategories();
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
                              final controller =
                                  Get.find<ServiceCategoryEditController>();
                              await controller
                                  .setContactForm(serviceCategory.id);
                              Get
                                ..back<void>()
                                ..to<void>(() =>
                                    BusinessManagerAddOrEditServiceCategory(
                                        serviceCatalog: serviceCategory));
                              /*  Get
                                ..back<void>()
                                ..to<void>(() => BusinessManagerAddOrEditServiceCatalogs(serviceCatalog: serviceCategory));*/
                            },
                            text: 'Edit',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
