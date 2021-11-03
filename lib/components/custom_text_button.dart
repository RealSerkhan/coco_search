import 'package:coco_search/core/colors.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final Widget child;
  final Function()? onPressed;
  final Color? color;
  final EdgeInsets? padding;

  const CustomTextButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.color,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SizedBox(
        height: 52,
        width: double.infinity,
        child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.disabled)) {
                return Colors.grey;
              }
              return color ?? CustomColors.grey;
            }),
          ),
          onPressed: onPressed,
          child: child,
        ),
      ),
    );
  }
}
