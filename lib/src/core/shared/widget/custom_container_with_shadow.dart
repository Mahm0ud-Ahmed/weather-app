import 'package:flutter/material.dart';

class CustomContainerWithShadow extends StatelessWidget {
  const CustomContainerWithShadow({
    Key? key,
    this.child,
    this.width,
    this.backgroundColor,
    this.shadowColor,
    this.padding,
  }) : super(key: key);

  final double? width;
  final Color? backgroundColor;
  final Color? shadowColor;
  final EdgeInsetsGeometry? padding;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? Colors.blue.shade100,
            blurRadius: 30,
            spreadRadius: 5,
          ),
        ],
      ),
      child: child,
    );
  }
}
