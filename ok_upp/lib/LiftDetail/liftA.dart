// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ok_upp/homePage.dart';

class LiftDetail {
  final String liftDetailTitle;

  const LiftDetail({
    required this.liftDetailTitle,

  });
}

class LiftA extends StatefulWidget {
  const LiftA({Key? key}) : super(key: key);

  @override
  State<LiftA> createState() => _LiftAState();
}

class _LiftAState extends State<LiftA> {
  List<LiftDetail> liftlist = [
    LiftDetail(liftDetailTitle: 'ETA: ' + HomePage.liftnameA),
    LiftDetail(liftDetailTitle: 'Current Floor: ' + HomePage.currFA),
    LiftDetail(liftDetailTitle: 'Number of People inside: ' + HomePage.noPPlA),
    LiftDetail(liftDetailTitle: 'State of Lift: ' + HomePage.liftStateA)
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
        itemBuilder: (context, index){
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
        }
      ),
    );
  }
}