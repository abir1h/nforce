import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../utils/colors.dart';
import '../../../../../utils/text_styles.dart';

class AddWorkOrderController extends GetxController {
  String? selectedRegion;
  String? selectedContact;
  String? selectedPackage;
  OverlayEntry? overlayEntry;
  List<String> items = [
    'Ronald Richards',
    'Ronald Richards2',
    'Ronald Richards',
    'Ronald Richards',
    'Ronald Richards',
  ];
  List<String> itemsContact = [
    'Dhaka',
    'New York',
  ];
  List<String> itemsPackage = [
    'Insect Removal',
    'Landscape Enhancements',
    'Law Care',
    'Law Fertilization',
    'Pest Removal Service',
  ];

  void showSearchableDialog(BuildContext context, List<String> items,
      Function(String) onItemSelected) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.8),
      builder: (BuildContext context) => StatefulBuilder(
        builder: (context, setState) => LayoutBuilder(
          builder: (context, constraints) {
            return Dialog(
              insetPadding:
                  EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.only(top: 10.h, bottom: 10.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ColoredBox(
                          color: AppColors.textFieldBackground,
                          child: TextFormField(
                            controller: TextEditingController(),
                            cursorColor: AppColors.primaryBlue1,
                            autocorrect: false,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                              hintText: 'Search here',
                              prefixIcon: const Icon(Icons.search),
                              suffixIcon: const Padding(
                                padding: EdgeInsets.only(right: 18.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(Icons.add),
                                    SizedBox(width: 4),
                                    Text(
                                      'Add',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              hintStyle:
                                  CustomTextStyle.paragraphSmall.copyWith(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                              border: const UnderlineInputBorder(),
                            ),
                          ),
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          itemCount: items.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(items[index]),
                              onTap: () {
                                onItemSelected(items[index]);
                                Navigator.pop(context);
                              },
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                              thickness: 1,
                              color: Colors.grey,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
