import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trogen_task/core/theme/app_pallete.dart';

class ChangeButtonContainer extends StatelessWidget {
  const ChangeButtonContainer({
    super.key,
    this.onTap,
    required this.text,
  });
  final VoidCallback? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        width: 105,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Pallete.secondoryColor)),
        child: Center(
          child:
              Text(text, style: GoogleFonts.poppins(color: Pallete.blackColor)),
        ),
      ),
    );
  }
}
