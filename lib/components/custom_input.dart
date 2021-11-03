import 'package:coco_search/core/colors.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  final String? hintText;
  final bool obscureText;
  final int? maxLines;
  final FocusNode? focusNode;
  final bool? autoFocus;
  final Widget? suffix;
  final bool? hasBorder;

  const CustomInput(
      {Key? key,
      required this.controller,
      this.hintText,
      this.onChanged,
      this.maxLines = 1,
      this.obscureText = false,
      this.focusNode,
      this.autoFocus = false,
      this.suffix,
      this.hasBorder = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: TextField(
        autofocus: autoFocus!,
        controller: controller,
        obscureText: obscureText,
        maxLines: maxLines,
        onChanged: onChanged,
        focusNode: focusNode,
        decoration: InputDecoration(
          suffix: suffix,
          hintText: hintText ?? '',
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: hasBorder!
                ? BorderSide.none
                : const BorderSide(
                    color: CustomColors.grey,
                  ),
          ),
        ),
      ),
    );
  }
}
