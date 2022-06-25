// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ok_upp/homePage.dart';

class LiftDetail {
  final String liftDetailTitle;

  const LiftDetail({
    required this.liftDetailTitle,
  });
}

class LiftB extends StatefulWidget {
  const LiftB({Key? key}) : super(key: key);

  @override
  State<LiftB> createState() => _LiftBState();
}

class _LiftBState extends State<LiftB> {
  List<LiftDetail> liftlist = [
    LiftDetail(liftDetailTitle: 'ETA: ' + HomePage.liftnameB),
    LiftDetail(liftDetailTitle: 'Current Floor: ' + HomePage.currFB),
    LiftDetail(liftDetailTitle: 'Number of People inside: ' + HomePage.noPPlB),
    LiftDetail(liftDetailTitle: 'State of Lift: ' + HomePage.liftStateB),
  ];   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lift A Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Cairo",
          ),
        ),
        backgroundColor: Colors.blueGrey[900],
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
          itemCount: liftlist.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
              ),
              child: Card(
                child: ListTile(
                  title: Text(
                    liftlist[index].liftDetailTitle,
                    style: const TextStyle(
                      fontFamily: "Cairo",
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}