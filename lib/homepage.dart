import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/progress_container.dart';
import 'package:flutter_application_1/public.dart';
import 'package:flutter_application_1/question_screen.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  var d;
  @override
  Widget build(BuildContext context) {
    final hei = MediaQuery.of(context).size.height;
    final wid = MediaQuery.of(context).size.width;

    return Scaffold(
        body: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('question').snapshots(),
            builder: ((context, snap1) {
              return StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('scores')
                      .snapshots(),
                  builder: (context, snap2) {
                    if (snap1.hasData) {
                      if (snap1.data!.docs[0]['status'].toString() == "1") {
                        return questions(
                          question: snap1.data!.docs[1]['question'],
                          option1: snap1.data!.docs[1]['opt1'],
                          option2: snap1.data!.docs[1]['opt2'],
                          option3: snap1.data!.docs[1]['opt3'],
                          option4: snap1.data!.docs[1]['opt4'],
                          duration: 0,
                          answer: snap1.data!.docs[1]['answer'],
                        );
                      }
                      if (snap1.data!.docs[0]['status'].toString() == "2") {
                        return questions(
                          question: snap1.data!.docs[3]['question'],
                          option1: snap1.data!.docs[3]['opt1'],
                          option2: snap1.data!.docs[3]['opt2'],
                          option3: snap1.data!.docs[3]['opt3'],
                          option4: snap1.data!.docs[3]['opt4'],
                          answer: snap1.data!.docs[3]['answer'],
                          duration: -1,
                        );
                      }
                      if (snap1.data!.docs[0]['status'].toString() == "3") {
                        return questions(
                          question: snap1.data!.docs[4]['question'],
                          option1: snap1.data!.docs[4]['opt1'],
                          option2: snap1.data!.docs[4]['opt2'],
                          option3: snap1.data!.docs[4]['opt3'],
                          option4: snap1.data!.docs[4]['opt4'],
                          answer: snap1.data!.docs[4]['answer'],
                          duration: -1,
                        );
                      }
                      if (snap1.data!.docs[0]['status'].toString() == "4") {
                        return questions(
                          question: snap1.data!.docs[5]['question'],
                          option1: snap1.data!.docs[5]['opt1'],
                          option2: snap1.data!.docs[5]['opt2'],
                          option3: snap1.data!.docs[5]['opt3'],
                          option4: snap1.data!.docs[5]['opt4'],
                          answer: snap1.data!.docs[5]['answer'],
                          duration: -1,
                        );
                      }
                      if (snap1.data!.docs[0]['status'].toString() == "5") {
                        return questions(
                          question: snap1.data!.docs[6]['question'],
                          option1: snap1.data!.docs[6]['opt1'],
                          option2: snap1.data!.docs[6]['opt2'],
                          option3: snap1.data!.docs[6]['opt3'],
                          option4: snap1.data!.docs[6]['opt4'],
                          answer: snap1.data!.docs[6]['answer'],
                          duration: -1,
                        );
                      }
                      if (snap1.data!.docs[0]['status'].toString() == "6") {
                        return questions(
                          question: snap1.data!.docs[7]['question'],
                          option1: snap1.data!.docs[7]['opt1'],
                          option2: snap1.data!.docs[7]['opt2'],
                          option3: snap1.data!.docs[7]['opt3'],
                          option4: snap1.data!.docs[7]['opt4'],
                          answer: snap1.data!.docs[7]['answer'],
                          duration: -1,
                        );
                      }
                      if (snap1.data!.docs[0]['status'].toString() == "7") {
                        return questions(
                          question: snap1.data!.docs[8]['question'],
                          option1: snap1.data!.docs[8]['opt1'],
                          option2: snap1.data!.docs[8]['opt2'],
                          option3: snap1.data!.docs[8]['opt3'],
                          option4: snap1.data!.docs[8]['opt4'],
                          answer: snap1.data!.docs[8]['answer'],
                          duration: -1,
                        );
                      }
                      if (snap1.data!.docs[0]['status'].toString() == "8") {
                        return questions(
                          question: snap1.data!.docs[9]['question'],
                          option1: snap1.data!.docs[9]['opt1'],
                          option2: snap1.data!.docs[9]['opt2'],
                          option3: snap1.data!.docs[9]['opt3'],
                          option4: snap1.data!.docs[9]['opt4'],
                          answer: snap1.data!.docs[9]['answer'],
                          duration: -1,
                        );
                      }
                      if (snap1.data!.docs[0]['status'].toString() == "9") {
                        return questions(
                          question: snap1.data!.docs[10]['question'],
                          option1: snap1.data!.docs[10]['opt1'],
                          option2: snap1.data!.docs[10]['opt2'],
                          option3: snap1.data!.docs[10]['opt3'],
                          option4: snap1.data!.docs[10]['opt4'],
                          answer: snap1.data!.docs[10]['answer'],
                          duration: -1,
                        );
                      }
                      if (snap1.data!.docs[0]['status'].toString() == "99") {
                        return questions(
                          question: snap1.data!.docs[2]['question'],
                          option1: snap1.data!.docs[2]['opt1'],
                          option2: snap1.data!.docs[2]['opt2'],
                          option3: snap1.data!.docs[2]['opt3'],
                          option4: snap1.data!.docs[2]['opt4'],
                          answer: snap1.data!.docs[2]['answer'],
                          duration: -1,
                        );
                      }
                    }
                    return Container();
                  });
            })));
  }
}
