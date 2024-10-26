import 'package:carousel_slider/carousel_slider.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:trogen_task/core/theme/app_pallete.dart';
import 'package:trogen_task/features/chat/view/pages/chat_screen.dart';
import 'package:trogen_task/features/home/controller/home_controller.dart';
import 'package:trogen_task/features/home/view/widgets/change_button_container.dart';
import 'package:trogen_task/features/home/view/widgets/flipcard_container.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  void initState() {
    super.initState();
  }

  final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  CarouselSliderController buttonCarouselController =
      CarouselSliderController();
  goNext() {
    buttonCarouselController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
  }

  goPrev() {
    buttonCarouselController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 2, child: header()),
          Expanded(flex: 1, child: belowHeaderSection(context)),
          Expanded(
            flex: 6,
            child: centerBodySection(),
          ),
          Expanded(flex: 2, child: lastSection()),
        
        
        ],
      ),
    );
  }

  Row lastSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ChangeButtonContainer(
          onTap: () {
            goPrev();
          },
          text: "Previous",
        ),
        ChangeButtonContainer(
          onTap: () {
            goNext();
          },
          text: "Next",
        ),
      ],
    );
  }

  CarouselSlider centerBodySection() {
    return CarouselSlider(
      carouselController: buttonCarouselController,
      options: CarouselOptions(
        onPageChanged: (index, reason) {
          Get.put(HomeController()).updateCurrentInx(index + 1);
        },
        height: 285,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        autoPlay: false,
      ),
      items: List.generate(
        15,
        (index) {
          return Builder(
            builder: (BuildContext context) {
              return FlipCard(
                  direction: FlipDirection.HORIZONTAL,
                  front: flipCardContainer(
                    index: index,
                  ),
                  back: flipCardContainer(
                    isBack: true,
                    index: index,
                  ));
            },
          );
        },
      ),
    );
  }

  Row belowHeaderSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(),
                ));
          },
          child: Text(
            "       Evereyday Phrases",
            style: GoogleFonts.poppins(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Pallete.blackColor),
          ),
        ),
        GetBuilder<HomeController>(builder: (controller) {
          return CircularPercentIndicator(
            radius: 24.0,
            lineWidth: 6.0,
            percent: controller.currentInx /
                15, // Set your percentage here as a value between 0.0 and 1.0
            center: Text(
              "${controller.currentInx}/15",
              style: GoogleFonts.poppins(
                  color: Pallete.blackColor,
                  fontSize: 11.0,
                  fontWeight: FontWeight.bold),
            ),
            progressColor: Pallete.secondoryColor,
            backgroundColor: Colors.grey[200]!,
            circularStrokeCap:
                CircularStrokeCap.round, // Makes the edges rounded
          );
        }),
      ],
    );
  }

  ClipPath header() {
    return ClipPath(
      clipper: CustomCurveClipper(),
      child: Container(
        color: Pallete.secondoryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.arrow_back_ios,
                color: Pallete.whiteColor,
                size: 27,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Flash Card",
                    style: GoogleFonts.poppins(
                        color: Pallete.whiteColor,
                        fontSize: 21,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types

class CustomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60); // Create a curve starting point
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 60);
    path.lineTo(size.width, 0); // Close the path to the top right
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true; // Set to true if you want to reclip when properties change
  }
}
