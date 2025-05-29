import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  const CustomText({
    Key? key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: GoogleFonts.comfortaa(
        color: color,
        fontSize: fontSize?.sp ?? 14.sp,
        fontWeight: fontWeight,
      ),
    );
  }
}
