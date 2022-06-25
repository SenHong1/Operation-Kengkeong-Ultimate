// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TermsNConditions extends StatefulWidget {
  const TermsNConditions({Key? key}) : super(key: key);

  @override
  State<TermsNConditions> createState() => _TermsNConditionsState();
}

class _TermsNConditionsState extends State<TermsNConditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Terms & Conditions',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Cairo",
          ),
        ),
        backgroundColor: Colors.blueGrey[900],
      ),
      backgroundColor: Colors.black,
      body: const Text(
        '你妈妈',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 100,
          color: Colors.white,
        ),
      ),      
    );
  }
}