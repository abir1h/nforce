import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_address/add_new_email_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_address/add_new_event_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_address/add_new_license_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_address/add_new_note_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_address/add_new_phone_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_address/add_new_service_region_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_address/customer_address_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_address/widgets/address_with_static_map.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_address/widgets/custom_fab.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_address/widgets/customer_address_mini_tabs.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_address/widgets/mini_email_tile.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_address/widgets/mini_event_tile.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_address/widgets/mini_license_tile.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_address/widgets/mini_note_tile.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_address/widgets/mini_service_region_tile.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_address/widgets/mini_view_bottomsheet.dart';
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
                ContactDetailsTabEnum.emails => Expanded(child: _email()),
                ContactDetailsTabEnum.events => Expanded(child: _event()),
                ContactDetailsTabEnum.notes => Expanded(child: _note()),
                ContactDetailsTabEnum.licenses => Expanded(child: _license()),
                ContactDetailsTabEnum.serviceRegions => Expanded(child: _serviceRegion()),
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
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: GestureDetector(
                onTap: () {
                  miniViewBottomSheet(
                    context: context,
                    titleSubtitles: [
                      TitleSubtitle(title: 'Title', subtitle: 'Primary'),
                      TitleSubtitle(title: 'Phone', subtitle: '61123123123'),
                    ],
                    onEdit: () {
                      Get.to(() => const AddNewPhoneNumberView());
                    },
                    onDelete: () {},
                  );
                },
                child: const Phone(),
              ),
            );
          },
        ),
      );
  Widget _email() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: GestureDetector(
                onTap: () {
                  miniViewBottomSheet(
                    context: context,
                    titleSubtitles: [
                      TitleSubtitle(title: 'Title', subtitle: 'Primary'),
                      TitleSubtitle(title: 'Email', subtitle: 'info@numail.com'),
                    ],
                    onEdit: () {
                      Get.to(() => const AddNewEmailView());
                    },
                    onDelete: () {},
                  );
                },
                child: const MiniEmailTile(),
              ),
            );
          },
        ),
      );

  Widget _serviceRegion() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: GestureDetector(
                onTap: () {
                  miniViewBottomSheet(
                    context: context,
                    titleSubtitles: [
                      TitleSubtitle(title: 'Service Region', subtitle: 'Dhaka'),
                    ],
                    onEdit: () {
                      Get.to(() => const AddNewNoteView());
                    },
                    onDelete: () {},
                  );
                },
                child: const MiniServiceRegionTile(),
              ),
            );
          },
        ),
      );

  Widget _license() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: GestureDetector(
                onTap: () {
                  miniViewBottomSheet(
                    context: context,
                    titleSubtitles: [
                      TitleSubtitle(title: 'License or Compliance Title', subtitle: 'Home service license'),
                      TitleSubtitle(title: 'License or Compliance No', subtitle: 'HS2023-12345'),
                      TitleSubtitle(title: 'Date of Award', subtitle: '30 Aug, 2023'),
                      TitleSubtitle(title: 'Details of Award', subtitle: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
                    ],
                    onEdit: () {
                      Get.to(() => const AddNewNoteView());
                    },
                    onDelete: () {},
                  );
                },
                child: const MiniLicenseTile(),
              ),
            );
          },
        ),
      );

  Widget _note() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: GestureDetector(
                onTap: () {
                  miniViewBottomSheet(
                    context: context,
                    titleSubtitles: [
                      TitleSubtitle(title: 'Note', subtitle: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
                    ],
                    onEdit: () {
                      Get.to(() => const AddNewNoteView());
                    },
                    onDelete: () {},
                  );
                },
                child: const MiniNoteTile(),
              ),
            );
          },
        ),
      );

  Widget _event() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: GestureDetector(
                onTap: () {
                  miniViewBottomSheet(
                    context: context,
                    titleSubtitles: [
                      TitleSubtitle(title: 'Title', subtitle: 'Primary'),
                      TitleSubtitle(title: 'Date', subtitle: '23-12-24'),
                      TitleSubtitle(title: 'Description', subtitle: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
                    ],
                    onEdit: () {
                      Get.to(() => const AddNewEmailView());
                    },
                    onDelete: () {},
                  );
                },
                child: const MiniEventTile(),
              ),
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
              onTap: () {
                Get.to(() => const AddNewEmailView());
              },
              title: 'Add Email',
            ),
          ContactDetailsTabEnum.events => CustomFloatingActionButton(
              onTap: () {
                Get.to(() => const AddNewEventView());
              },
              title: 'Add Event',
            ),
          ContactDetailsTabEnum.notes => CustomFloatingActionButton(
              onTap: () {
                Get.to(() => const AddNewNoteView());
              },
              title: 'Add Note',
            ),
          ContactDetailsTabEnum.licenses => CustomFloatingActionButton(
              onTap: () {
                Get.to(() => const AddNewLicenseView());
              },
              title: 'Add License',
            ),
          ContactDetailsTabEnum.serviceRegions => CustomFloatingActionButton(
              onTap: () {
                Get.to(() => const AddNewServiceRegionView());
              },
              title: 'Add Service Region',
            ),
        };
      },
    );
  }
}

class TitleSubtitle {
  final String title;
  final String subtitle;

  TitleSubtitle({
    required this.title,
    required this.subtitle,
  });
}
