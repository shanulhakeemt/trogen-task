import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trogen_task/core/theme/app_pallete.dart';
import 'package:trogen_task/features/home/controller/home_controller.dart';

// ignore: camel_case_types
class flipCardContainer extends StatelessWidget {
  const flipCardContainer(
      {super.key, this.isBack = false, required this.index});
  final bool isBack;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 300,
        height: 200,
        decoration: BoxDecoration(
          color: controller.currentInx - 1 == index
              ? Pallete.secondoryColor
              : Pallete.inactiveCardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              isBack ? "Obvio- ${index + 1} Back" : "Obvio- ${index + 1}",
              style: GoogleFonts.nunitoSans(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Pallete.whiteColor),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  CupertinoIcons.speaker_2,
                  size: 25,
                  color: Pallete.whiteColor,
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  "ob.wi.o",
                  style: GoogleFonts.nunitoSans(
                      fontSize: 20, color: Pallete.whiteColor),
                )
              ],
            ),
            Container(
              height: 50,
              width: 57,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(1, 1),
                      color: Pallete.whiteColor,
                      blurRadius: .1)
                ],
                color: Pallete.whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Pallete.blackColor,
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
