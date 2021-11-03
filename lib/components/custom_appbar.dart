import 'dart:ui';

import 'package:coco_search/core/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  Function()? onTapLeading;
  List<Widget>? actions;
  String? title;
  bool implementBackButton;
  Color? backgroundColor;
  CustomAppBar(
      {this.onTapLeading,
      this.actions,
      this.title,
      this.backgroundColor,
      this.implementBackButton = true})
      : preferredSize = const Size.fromHeight(44);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  final Size preferredSize;
  // Size get preferredSize => throw UnimplementedError();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.backgroundColor ?? Colors.white,
      toolbarHeight: 44,
      shadowColor: Colors.transparent,
      leadingWidth: 44,
      actions: widget.actions,
      leading: !widget.implementBackButton
          ? const SizedBox.shrink()
          : InkWell(
              borderRadius: BorderRadius.circular(22),
              child: Center(
                child: SvgPicture.asset(
                  'assets/vectors/arrow_left.svg',
                  width: 8,
                  fit: BoxFit.fitWidth,
                  color: CustomColors.black,
                ),
              ),
              onTap: widget.onTapLeading,
            ),
      centerTitle: true,
      title: widget.title == null
          ? const SizedBox.shrink()
          : Text(
              widget.title!,
              style: const TextStyle(
                  fontSize: 20,
                  color: CustomColors.black,
                  fontWeight: FontWeight.w600),
            ),
    );
  }
}
