import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final void Function()? onPressed; // Updated type
  final Widget content;
  final Color borderColor;
  final bool addBorder;
  final Color color;
  final double width;
  final double height;
  final bool disabled;
  final double radius;
  final double padding;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.content,
    this.borderColor = Colors.black12,
    this.color = Colors.black,
    this.width = 200,
    this.height = 50,
    this.addBorder = false,
    this.disabled = false,
    this.radius = 48,
    this.padding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: !disabled ? color : Colors.grey,
        borderRadius: BorderRadius.circular(radius),
        border: addBorder ? Border.all(color: borderColor, width: 1) : null,
      ),
      child: MaterialButton(
        onPressed: disabled ? null : onPressed, // Removed unnecessary lambda
        child: content,
      ),
    );
  }
}
