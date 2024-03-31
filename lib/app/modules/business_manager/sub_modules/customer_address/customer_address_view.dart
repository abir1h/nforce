import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_address/customer_address_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_address/widgets/customer_address_mini_tabs.dart';
import 'package:nuforce/app/modules/customer/customer_work_order/controllers/customer_work_order_controller.dart';
import 'package:nuforce/app/modules/new_orders/models/contact_details_model.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/edit_button.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';

class CustomerAddressView extends StatefulWidget {
  const CustomerAddressView({
    required this.contactDetails,
    super.key,
  });
  final SelectedContactDetails contactDetails;

  @override
  State<CustomerAddressView> createState() => _CustomerAddressViewState();
}

class _CustomerAddressViewState extends State<CustomerAddressView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarMinimal(
        title: 'Contact Details',
        trailing: [
          EditButton(onTap: () {}),
          15.w.hSpace,
        ],
      ),
      body: Column(
        children: [
          Table(
            children: [
              _tableRow(
                title: 'Name',
                value: widget.contactDetails.contact?.name ?? 'N/A',
              ),
              _tableRow(
                title: 'Company',
                value: widget.contactDetails.contact?.company ?? 'N/A',
              ),
              _tableRow(
                title: 'Primary Email',
                value: widget.contactDetails.contact?.primaryEmail ?? 'N/A',
              ),
              _tableRow(
                title: 'Primary Mobile',
                value: widget.contactDetails.contact?.primaryMobile ?? 'N/A',
              ),
              _tableRow(
                title: 'Group',
                value: widget.contactDetails.contact?.groupName ?? 'N/A',
              ),
            ],
          ),
          const CustomerAddressMinMiniTabs(),
          // write a switch case for the tabEnum
          GetBuilder<CustomerAddressController>(
            builder: (controller) {
              return switch (controller.tabEnum) {
                ContactDetailsTabEnum.addresses => _addresses(),
                ContactDetailsTabEnum.phones => Container(),
                ContactDetailsTabEnum.emails => Container(),
                ContactDetailsTabEnum.events => Container(),
                ContactDetailsTabEnum.notes => Container(),
                ContactDetailsTabEnum.licenses => Container(),
                ContactDetailsTabEnum.serviceRegions => Container(),
              };
            },
          ),
        ],
      ),
    );
  }

  Container _addresses() => Container();

  TableRow _tableRow({required String title, required String value}) {
    return TableRow(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.w, bottom: 15.h),
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.nutralBlack2,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.w, bottom: 15.h),
          child: Text(
            ': $value',
            style: TextStyle(
              color: AppColors.nutralBlack1,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
