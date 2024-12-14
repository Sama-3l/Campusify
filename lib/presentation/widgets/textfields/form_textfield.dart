// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:campusify/algorithms/methods.dart';
import 'package:campusify/constants/colors.dart';
import 'package:campusify/constants/extensions.dart';
import 'package:campusify/constants/sizes.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class FormTextfield extends StatelessWidget {
  FormTextfield({
    super.key,
    this.controller,
    this.maxLines = 1,
    required this.placeholder,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
    this.obscure = false,
    required this.style,
    this.placeholderStyle,
    this.title,
    this.suffix,
    this.prefix,
    this.readOnly = false,
    this.items,
  });

  final TextEditingController? controller;
  int maxLines;
  String placeholder;
  TextStyle style;
  TextStyle? placeholderStyle;
  EdgeInsets padding;
  bool obscure;
  Widget? suffix;
  Widget? prefix;
  String? title;
  bool readOnly;
  final Methods func = Methods();
  List<String>? items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: context.heading,
          ),
          kGap12,
        ],
        CupertinoTextField(
          readOnly: readOnly,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.blackSecondary),
            borderRadius: BorderRadius.circular(10),
          ),
          controller: controller,
          padding: padding,
          style: style,
          obscureText: obscure,
          placeholder: placeholder,
          suffix: suffix,
          prefix: prefix,
        ),
      ],
    );
  }
}
