import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';

class ExpandedList extends StatefulWidget {
  final Widget header;
  final List<String> itemList;

  const ExpandedList({super.key, required this.header, required this.itemList});

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
        if (isExpanded) const SizedBox() else widget.header,
        if (isExpanded)
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              return Text(
                '• ${widget.itemList[index]}',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  fontFamily: 'Poppins',
                  color: AppColors.nutralBlack2,
                ),
              );
            },
            shrinkWrap: true,
            itemCount: widget.itemList.length,
            separatorBuilder: (_, index) {
              return SizedBox(height: 8.h);
            },
          ),
        if (isExpanded)
          InkWell(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Row(
              children: [
                Text(
                  'Show Less',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp, fontFamily: 'Poppins', color: AppColors.nutralBlack2),
                ),
                Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
              ],
            ),
          )
        else
          InkWell(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Row(
              children: [
                Text(
                  'Show More',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp, fontFamily: 'Poppins', color: AppColors.nutralBlack2),
                ),
                Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
              ],
            ),
          ),
      ],
    );
  }
}
