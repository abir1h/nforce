import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:textfield_tags/textfield_tags.dart';

class TagsInputField extends StatefulWidget {
  const TagsInputField({super.key});

  @override
  State<TagsInputField> createState() => _TagsInputFieldState();
}

class _TagsInputFieldState extends State<TagsInputField> {
  late double _distanceToField;
  late TextfieldTagsController _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = TextfieldTagsController();
  }

  // static const List<String> _pickLanguage = <String>['c', 'c++', 'java', 'python', 'javascript', 'php', 'sql', 'yaml', 'gradle', 'xml', 'html', 'flutter', 'css', 'dockerfile'];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Autocomplete<String>(
          optionsViewBuilder: (context, onSelected, options) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Align(
                alignment: Alignment.topCenter,
                child: Material(
                  elevation: 4,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 200),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: options.length,
                      itemBuilder: (BuildContext context, int index) {
                        final dynamic option = options.elementAt(index);
                        return TextButton(
                          onPressed: () {
                            onSelected(option);
                          },
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Text(
                                option as String,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 74, 137, 92),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
          },
          optionsBuilder: (TextEditingValue textEditingValue) {
            return const Iterable<String>.empty();
            // if (textEditingValue.text == '') {
            // }
            // return _pickLanguage.where((String option) {
            //   return option.contains(textEditingValue.text.toLowerCase());
            // });
          },
          onSelected: (String selectedTag) {
            _controller.addTag(selectedTag);
          },
          fieldViewBuilder: (context, ttec, tfn, onFieldSubmitted) {
            return TextFieldTags(
              textEditingController: ttec,
              focusNode: tfn,
              textfieldTagsController: _controller,
              initialTags: const [
                'Service',
                'Hydrowash',
                'Insultation',
              ],
              textSeparators: const [' ', ','],
              letterCase: LetterCase.normal,
              inputFieldBuilder: (context, inputFieldValues) {
                return TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                    prefixIconConstraints: BoxConstraints(maxWidth: _distanceToField * 0.74),
                    prefixIcon: inputFieldValues.tags.isNotEmpty
                        ? Padding(
                            padding: EdgeInsets.only(left: 16.sp),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: inputFieldValues.tags.map<Widget>((dynamic tag) {
                                  return Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(4)),
                                      color: AppColors.white2,
                                    ),
                                    margin: const EdgeInsets.only(right: 5),
                                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          child: const Icon(
                                            Icons.close,
                                            size: 18,
                                            color: AppColors.subText,
                                          ),
                                          onTap: () {
                                            // onTagDelete(tag);
                                            inputFieldValues.tags.remove(tag);
                                            setState(() {});
                                          },
                                        ),
                                        const SizedBox(width: 4),
                                        InkWell(
                                          child: Text(
                                            tag,
                                            style: const TextStyle(
                                              color: AppColors.subText,
                                            ),
                                          ),
                                          onTap: () {
                                            //print("$tag selected");
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          )
                        : null,
                  ),
                  onChanged: inputFieldValues.onChanged,
                  onSubmitted: inputFieldValues.onSubmitted,
                );
              },
            );
          },
        ),
      ],
    );
  }
}
