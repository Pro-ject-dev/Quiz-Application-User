import 'dart:html';
import 'dart:ui';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/progress_container.dart';
import 'package:flutter_application_1/public.dart';
import 'package:flutter_application_1/route_method.dart';
import 'package:flutter_application_1/scoreboard.dart';
import 'package:flutter_application_1/teams.dart';
import 'package:google_fonts/google_fonts.dart';

class questions extends StatefulWidget {
  final question, option1, option2, option3, option4, duration, answer;
  questions({
    required this.question,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
    required this.answer,
    this.duration,
  });

  @override
  State<questions> createState() => _questionsState();
}

class _questionsState extends State<questions> {
  String time = '0';
  var ans;

  final CountDownController timer = CountDownController();

  @override
  Widget build(BuildContext context) {
    if (widget.duration == -1) {
      timer.restart();
    }
    final hei = MediaQuery.of(context).size.height;
    final wid = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(children: [
      Opacity(
        opacity: 0.92,
        child: SizedBox(
          height: hei,
          width: wid,
          child: Image.asset(
            'assets/bgimg.gif',
            fit: BoxFit.cover,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                    child: Container(
                        height: hei * 0.9,
                        width: wid * 0.7,
                        decoration: BoxDecoration(
                          color: Colors.transparent.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Column(children: [
                          Container(
                            height: hei * 0.098,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(207, 255, 255, 255)
                                    .withOpacity(0.32),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(7),
                                    topRight: Radius.circular(7))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text("Quiz Contest",
                                      style: GoogleFonts.poppins(
                                          shadows: [
                                            const Shadow(
                                                blurRadius: 0.5,
                                                color: Color.fromARGB(
                                                    255, 255, 0, 0))
                                          ],
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontSize: wid * 0.015,
                                          fontWeight: FontWeight.w600)),
                                  Container(
                                      margin: EdgeInsets.only(left: wid * 0.35),
                                      padding: EdgeInsets.all(wid * 0.008),
                                      height: hei * 0.08,
                                      width: wid * 0.11,
                                      decoration: BoxDecoration(
                                        color:
                                            const Color.fromARGB(210, 0, 0, 0),
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Time Left :",
                                              style: GoogleFonts.poppins(
                                                  color: const Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  fontSize: wid * 0.009,
                                                  fontWeight: FontWeight.w600)),
                                          CircularCountDownTimer(
                                              duration: 50,
                                              width: wid * 0.04,
                                              controller: timer,
                                              height: hei * 0.035,
                                              isReverse: true,
                                              ringColor: Colors.grey[300]!,
                                              fillColor: const Color.fromARGB(
                                                  255, 0, 0, 255),
                                              onChange: ((value) {
                                                time = value;
                                              }),
                                              onComplete: () async {
                                                Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            progress_container(
                                                                hei: hei,
                                                                wid: wid,
                                                                message:
                                                                    "Sorry Time Out....",
                                                                image:
                                                                    "assets/timeout.gif")),
                                                    (route) => false);
                                              },
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 255, 0, 0),
                                              strokeWidth: 4.0,
                                              strokeCap: StrokeCap.round,
                                              textStyle: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontSize: 10))
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: hei * 0.12),
                          SizedBox(
                            width: wid * 0.6,
                            child: Text(widget.question,
                                textAlign: TextAlign.start,
                                style: GoogleFonts.openSans(
                                    shadows: [
                                      const Shadow(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          blurRadius: 2)
                                    ],
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    fontSize: wid * 0.018,
                                    fontWeight: FontWeight.w600)),
                          ),
                          SizedBox(height: hei * 0.13),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                options(
                                    wid,
                                    hei,
                                    widget.option1,
                                    Colors.pink.withOpacity(0.3),
                                    Colors.pink,
                                    'A'),
                                options(
                                    wid,
                                    hei,
                                    widget.option2,
                                    Colors.cyan.withOpacity(0.3),
                                    Colors.cyan,
                                    'B'),
                              ],
                            ),
                          ),
                          SizedBox(height: hei * 0.09),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                options(
                                    wid,
                                    hei,
                                    widget.option3,
                                    Colors.pink.withOpacity(0.3),
                                    Colors.pink,
                                    'C'),
                                options(
                                    wid,
                                    hei,
                                    widget.option4,
                                    Colors.cyan.withOpacity(0.3),
                                    Colors.cyan,
                                    'D'),
                              ],
                            ),
                          ),
                        ])),
                  )
                ],
              ),
              SizedBox(width: wid * 0.015),
              scoreboard()
            ],
          ),
        ),
      ),
    ]));
  }

  Container options(double wid, double hei, String option, var bgcolor,
      var bordercolor, var answer) {
    return Container(
      // ignore: sort_child_properties_last
      child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: OutlinedButton(
            onPressed: () {
              ans = answer;
              store_questions();
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
              child: Text(option,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.openSans(
                      shadows: [
                        Shadow(
                            color: Colors.black.withOpacity(0.8),
                            blurRadius: 1.5)
                      ],
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: wid * 0.015,
                      fontWeight: FontWeight.w500)),
            ),
          )),
      height: hei * 0.1,
      width: wid * 0.2,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: bordercolor),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(blurRadius: 3, color: Colors.black.withOpacity(0.25))
          ],
          color: bgcolor),
    );
  }

  void store_questions() {
    var score;
    if (widget.answer == ans) {
      score = 10;
    } else {
      score = 0;
    }

    FirebaseFirestore.instance
        .collection('scores')
        .doc(teamname)
        .update({"score": FieldValue.increment(score), "teamname": teamname});
  }
}
