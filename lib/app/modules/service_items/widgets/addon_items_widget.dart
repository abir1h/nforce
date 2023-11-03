import 'package:flutter/material.dart';
import 'package:nuforce/app/modules/service_items/widgets/addon_item_card_widget.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/main.dart';

class AddonsItems extends StatefulWidget {
  const AddonsItems({super.key});

  @override
  State<AddonsItems> createState() => _AddonsItemsState();
}

class _AddonsItemsState extends State<AddonsItems> {
  String price = 'Paid + Free';
  String sort = 'Newest';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: CustomDropdownButton(
                  items: const [
                    DropdownMenuItem(value: 'Paid + Free', child: Text('Paid + Free')),
                    DropdownMenuItem(value: 'Paid', child: Text('Paid')),
                    DropdownMenuItem(value: 'Free', child: Text('Free')),
                  ],
                  hint: 'Price',
                  onChanged: (v) {
                    setState(() {
                      price = v.toString();
                    });
                  },
                  value: price,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 3,
                child: CustomDropdownButton(
                  items: const [
                    DropdownMenuItem(value: 'Newest', child: Text('Newest')),
                    DropdownMenuItem(value: 'Popular', child: Text('Popular')),
                    DropdownMenuItem(value: 'Old', child: Text('Old')),
                  ],
                  hint: 'Price',
                  onChanged: (v) {
                    setState(() {
                      sort = v.toString();
                    });
                  },
                  value: sort,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.textFieldBackground,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: AppColors.greyText),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.search,
                      color: AppColors.nutralBlack1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: AddonItemCard(
                  onInstallTap: () {},
                  onTap: () {},
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
