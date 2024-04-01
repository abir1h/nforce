import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_address/add_new_phone_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_address/customer_address_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_address/widgets/address_with_static_map.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_address/widgets/custom_fab.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_address/widgets/customer_address_mini_tabs.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_address/widgets/phone.dart';
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
      floatingActionButton: _getFloatingActionButton(),
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
          16.h.vSpace,
          GetBuilder<CustomerAddressController>(
            builder: (controller) {
              return switch (controller.tabEnum) {
                ContactDetailsTabEnum.addresses => Expanded(child: _addresses()),
                ContactDetailsTabEnum.phones => Expanded(child: _phone()),
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

  Widget _phone() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Phone(),
            );
          },
        ),
      );

  Widget _addresses() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: AddressWithStaticMap(),
            );
          },
        ),
      );

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

  Widget _getFloatingActionButton() {
    return GetBuilder<CustomerAddressController>(
      builder: (controller) {
        return switch (controller.tabEnum) {
          ContactDetailsTabEnum.addresses => CustomFloatingActionButton(
              onTap: () {},
              title: '+ Add Address',
            ),
          ContactDetailsTabEnum.phones => CustomFloatingActionButton(
              onTap: () {
                Get.to(() => const AddNewPhoneNumberView());
              },
              title: 'Add Phone',
            ),
          ContactDetailsTabEnum.emails => CustomFloatingActionButton(
              onTap: () {},
              title: 'Add Email',
            ),
          ContactDetailsTabEnum.events => CustomFloatingActionButton(
              onTap: () {},
              title: 'Add Event',
            ),
          ContactDetailsTabEnum.notes => CustomFloatingActionButton(
              onTap: () {},
              title: 'Add Note',
            ),
          ContactDetailsTabEnum.licenses => CustomFloatingActionButton(
              onTap: () {},
              title: 'Add License',
            ),
          ContactDetailsTabEnum.serviceRegions => CustomFloatingActionButton(
              onTap: () {},
              title: 'Add Service Region',
            ),
        };
      },
    );
  }
}
