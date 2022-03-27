// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ok_upp/homePage.dart';
import 'package:ok_upp/login.dart';

class RouterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                return const HomePage();
              } else if (snapshot.hasError) {
                return const Center(child: Text('Something Went Wrong!'));
              } else {
                return const LoginPage();
              }
            }),
      );
}
