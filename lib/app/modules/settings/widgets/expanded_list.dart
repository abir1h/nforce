import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';

class ExpandedList extends StatefulWidget {
  final Widget header;
  final List<String> itemList;

  ExpandedList({required this.header, required this.itemList});

  @override
  _ExpandedListState createState() => _ExpandedListState();
}

class _ExpandedListState extends State<ExpandedList> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isExpanded ? const SizedBox() : widget.header,
        if (isExpanded)
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              return Text("• ${widget.itemList[index]}",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      fontFamily: 'Poppins',
                      color: AppColors.nutralBlack2));
            },
            shrinkWrap: true,
            itemCount: widget.itemList.length,
            separatorBuilder: (_, index) {
              return SizedBox(height: 8.h);
            },
          ),
        isExpanded
            ? InkWell(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Row(
            children: [
              Text(
                "Show Less",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    fontFamily: 'Poppins',
                    color: AppColors.nutralBlack2),
              ),
              Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
            ],
          ),
        )
            : InkWell(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Row(
            children: [
              Text(
                "Show More",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    fontFamily: 'Poppins',
                    color: AppColors.nutralBlack2),
              ),
              Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
            ],
          ),
        )
      ],
    );
  }
}