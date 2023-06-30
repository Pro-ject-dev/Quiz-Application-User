import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class progress_container extends StatelessWidget {
  const progress_container({
    Key? key,
    required this.hei,
    required this.wid,
    required this.message,
    required this.image,
  }) : super(key: key);

  final double hei;
  final double wid;
  final image;
  final message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: hei,
          width: wid,
          child: Image.asset(
            'assets/bgimg.gif',
            fit: BoxFit.cover,
          ),
        ),
        Center(
            child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            height: hei,
            width: wid,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8)),
                  child: Container(
                    height: hei * 0.4,
                    width: wid * 0.3,
                    decoration: BoxDecoration(
                        color: Colors.transparent.withOpacity(0.2)),
                    child: Column(children: [
                      Center(
                          child: LinearProgressIndicator(
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                        minHeight: 5,
                        valueColor: new AlwaysStoppedAnimation<Color>(
                            Color.fromARGB(255, 0, 0, 0)),
                      )),
                      SizedBox(height: hei * 0.03),
                      Text(message,
                          style: GoogleFonts.poppins(
                              fontSize: wid * 0.02,
                              color: Color.fromARGB(255, 255, 255, 255))),
                      SizedBox(height: hei * 0.01),
                      Expanded(
                        child: Opacity(
                          opacity: 0.8,
                          child: SizedBox(
                            child: Image.asset(image, fit: BoxFit.cover),
                            width: double.infinity,
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ],
            ),
          ),
        )),
      ]),
    );
  }
}
