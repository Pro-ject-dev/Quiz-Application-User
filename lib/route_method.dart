import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/progress_container.dart';
import 'package:flutter_application_1/public.dart';
import 'package:flutter_application_1/start.dart';

class progress extends StatefulWidget {
  @override
  State<progress> createState() => _progressState();
}

class _progressState extends State<progress> {
  @override
  Widget build(BuildContext context) {
    final hei = MediaQuery.of(context).size.height;
    final wid = MediaQuery.of(context).size.width;
    return Scaffold(
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('teams')
                .doc(teamname)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                    ],
                  ),
                );
              }

              if (snapshot.hasData) {
                if (snapshot.data!['status'].toString() == "0") {
                  return progress_container(
                    hei: hei,
                    wid: wid,
                    message: "wait for confirmation",
                    image: 'assets/loading.gif',
                  );
                } else if (snapshot.data!['status'].toString() == "1") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const start()),
                  );
                }
              }
              if (snapshot.hasError) {
                return Container();
              }

              return Container();
            }));
  }
}
