import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ok_upp/routerPage.dart';
import 'package:provider/provider.dart';
import 'Provider/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => GoogleSignInProvider(),
    child: MaterialApp(
      title: 'Lift Management System',
      home: RouterPage(),
    )
  );
}