import 'package:flutter/material.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:textfield_tags/textfield_tags.dart';

class CustomTagsInput extends StatefulWidget {
  const CustomTagsInput({
    required this.stringTagController,
    super.key,
    this.label,
    this.hint,
  });

  final String? label;
  final String? hint;
  final StringTagController stringTagController;

  @override
  State<CustomTagsInput> createState() => _CustomTagsInputState();
}

class _CustomTagsInputState extends State<CustomTagsInput> {
  late double _distanceToField;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  void dispose() {
    super.dispose();
    widget.stringTagController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: CustomTextStyle.paragraphSmall.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.nutralBlack1,
              // fontSize: 20,
            ),
          ),
          const SizedBox(height: 8),
        ],
        TextFieldTags<String>(
          textfieldTagsController: widget.stringTagController,
          textSeparators: const [' ', ',', ';', '\n'],
          letterCase: LetterCase.normal,
          inputFieldBuilder: (context, inputFieldValues) {
            return TextField(
              onTap: () {
                widget.stringTagController.getFocusNode?.requestFocus();
              },
              controller: inputFieldValues.textEditingController,
              focusNode: inputFieldValues.focusNode,
              decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.greyText,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.greyText,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.primaryBlue1,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                hintText: widget.hint,
                hintStyle: CustomTextStyle.paragraphSmall.copyWith(
                  fontWeight: FontWeight.w400,
                ),
                errorText: inputFieldValues.error,
                prefixIconConstraints: BoxConstraints(maxWidth: _distanceToField * 0.8),
                prefixIcon: inputFieldValues.tags.isNotEmpty
                    ? SingleChildScrollView(
                        controller: inputFieldValues.tagScrollController,
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
                          child: Wrap(
                            runSpacing: 4.0,
                            spacing: 4.0,
                            children: inputFieldValues.tags.map((String tag) {
                              return Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                  color: AppColors.primaryBlue1,
                                ),
                                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      tag,
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                    const SizedBox(width: 4.0),
                                    InkWell(
                                      child: const Icon(
                                        Icons.cancel,
                                        size: 14.0,
                                        color: Color.fromARGB(255, 233, 233, 233),
                                      ),
                                      onTap: () {
                                        inputFieldValues.onTagRemoved(tag);
                                      },
                                    )
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      )
                    : null,
              ),
              onChanged: inputFieldValues.onTagChanged,
              onSubmitted: inputFieldValues.onTagSubmitted,
            );
          },
        ),
      ],
    );
  }
}
