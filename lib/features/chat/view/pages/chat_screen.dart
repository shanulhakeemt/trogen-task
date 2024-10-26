import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trogen_task/core/constants/assets_constants.dart';
import 'package:trogen_task/core/theme/app_pallete.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Container(
          alignment:
              Alignment.bottomCenter, // Align the button to the bottom center
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: FloatingActionButton(
              backgroundColor: Colors.white, // Replace with your color
              child: Image.asset(
                AssetsConstants.chatIcon1,
                scale: 7,
              ),
              onPressed: () {
                // Action when the button is pressed
              },
            ),
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerFloat, // Centers the button

        backgroundColor: const Color(0xffE9F0F9),
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
          leading: IconButton(
            icon: const Icon(
              Icons.close,
              color: Color.fromARGB(255, 18, 16, 16),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Pallete.whiteColor,
          title: Row(
            children: [
              Image.asset(
                AssetsConstants.chatIcon1,
                scale: 9,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "JOHN DOE",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 19,
                        color: Pallete.blackColor),
                  ),
                  Text(
                    "Online",
                    style: GoogleFonts.poppins(
                        fontSize: 16, color: const Color(0xffA40DEE)),
                  )
                ],
              )
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
                flex: 7,
                child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return messgeCard(
                      containerColor: index % 2 == 0
                          ? const Color(0xff122E57)
                          : Pallete.whiteColor,
                      isMyMessage: index % 2 == 0,
                    );
                  },
                )),
            Expanded(
                child: ClipPath(
              clipper: null,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Pallete.whiteColor),
                  child: TextFormField(
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                      border: InputBorder.none, // Remove the default border
                      enabledBorder:
                          InputBorder.none, // Remove border when enabled
                      focusedBorder: InputBorder.none,
                      prefixIcon: IconButton(
                        onPressed: () {
                          FocusScope.of(context).requestFocus(_focusNode);
                        },
                        icon: const Padding(
                          padding: EdgeInsets.only(left: 50),
                          child: Icon(
                            Icons.keyboard,
                            color: Pallete.blackColor,
                            size: 36,
                          ),
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Padding(
                          padding: EdgeInsets.only(right: 50),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Pallete.blackColor,
                            size: 36,
                          ),
                        ),
                      ),
                    ),
                  )),
            )),
          ],
        ));
  }
}

// ignore: camel_case_types
class messgeCard extends StatelessWidget {
  const messgeCard({
    this.isMyMessage = false,
    super.key,
    required this.containerColor,
  });
  final Color containerColor;
  final bool isMyMessage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          (!isMyMessage) ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        if (!isMyMessage)
          const SizedBox(
            width: 10,
          ),
        if (!isMyMessage)
          Image.asset(
            AssetsConstants.chatIcon1,
            scale: 7,
          ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:
                    isMyMessage ? Pallete.whiteColor : const Color(0xff122E57)),
            child: Padding(
              padding: const EdgeInsets.all(9),
              child: SizedBox(
                width: 200,
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum",
                  style: GoogleFonts.poppins(
                      color: !isMyMessage
                          ? Pallete.whiteColor
                          : Pallete.blackColor),
                ),
              ),
            ),
          ),
        ),
        if (isMyMessage)
          const CircleAvatar(
            radius: 23,
            backgroundImage: AssetImage(AssetsConstants.profileImg),
          ),
        if (isMyMessage)
          const SizedBox(
            width: 10,
          ),
      ],
    );
  }
}
