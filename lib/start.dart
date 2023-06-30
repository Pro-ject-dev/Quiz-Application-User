import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

class start extends StatefulWidget {
  const start({super.key});

  @override
  State<start> createState() => _start();
}

class _start extends State<start> {
  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width;
    double hei = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(children: [
      Opacity(
        opacity: 0.92,
        child: SizedBox(
          height: hei,
          width: wid,
          child: Image.asset(
            'assets/bg2.gif',
            fit: BoxFit.cover,
          ),
        ),
      ),
      Center(
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(
                height: hei,
                width: wid,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                        child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255)
                                  .withOpacity(1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: hei * 0.1,
                            width: wid * 0.2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 10,
                                          color: Color.fromARGB(
                                              221, 255, 255, 255))
                                    ],
                                    border: Border.all(
                                        color: Colors.black, width: 2)),
                                height: hei * 0.2,
                                width: wid * 0.3,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: MaterialButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  homepage())));
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: wid * 0.02,
                                        ),
                                        CircleAvatar(
                                          radius: 21,
                                          backgroundImage:
                                              AssetImage('assets/play.gif'),
                                        ),
                                        SizedBox(
                                          width: wid * 0.02,
                                        ),
                                        Text("Let's Start",
                                            style: GoogleFonts.poppins(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )))
                  ],
                ),
              )))
    ]));
  }
}
