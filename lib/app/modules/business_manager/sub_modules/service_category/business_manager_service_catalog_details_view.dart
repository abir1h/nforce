import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/service_category/business_manager_add_or_edit_service_catalog.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/service_category/business_manager_service_catalog_controller.dart';
import 'package:nuforce/app/modules/service_items/widgets/title_subtitle_minimal_widget.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/main.dart';

class BusinessManagerServiceCatalogsDeatilsView extends StatelessWidget {
  const BusinessManagerServiceCatalogsDeatilsView({
    required this.serviceCategory,
    super.key,
  });
  final MockServiceCatalog serviceCategory;

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
              TitleSubtitleMinimal(title: 'Name', subtitle: serviceCategory.name),
              const SizedBox(height: 16),
              TitleSubtitleMinimal(title: 'Ref Code', subtitle: serviceCategory.refCode),
              const SizedBox(height: 16),
              TitleSubtitleMinimal(title: 'Parent Category', subtitle: serviceCategory.parentCategory),
              const SizedBox(height: 16),
              TitleSubtitleMinimal(title: 'Google Taxonomy', subtitle: serviceCategory.googleTaxonomy),
              const SizedBox(height: 16),
              TitleSubtitleMinimal(title: 'Display Order', subtitle: serviceCategory.displayOrder),
              const SizedBox(height: 16),
              TitleSubtitleMinimal(title: 'Terms and Policies', subtitle: serviceCategory.termsAndConditions),
              const SizedBox(height: 16),
              TitleSubtitleMinimal(title: 'Tags', subtitle: serviceCategory.tags),
              const SizedBox(height: 16),
              TitleSubtitleMinimal(title: 'Description', subtitle: serviceCategory.description),
              const SizedBox(height: 32),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: SecondaryButton(
                      onPressed: () {
                        Get.back<void>();
                        final controller = Get.find<BusinessManagerController>();
                        controller.serviceCatalogsController.removeServiceCatalog(serviceCategory);
                        Fluttertoast.showToast(msg: 'Service Catalog Deleted');
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
                          ..to<void>(() => BusinessManagerAddOrEditServiceCatalogs(serviceCatalog: serviceCategory));
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
