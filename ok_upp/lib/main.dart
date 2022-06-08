import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:ok_upp/routerPage.dart';
import 'package:provider/provider.dart';
import 'Provider/google_sign_in.dart';
import 'package:ok_upp/splashScreen.dart';

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
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lift Management System',
      home: SplashScreen(),
    )
  );
}



//                                                         _ooOoo_
//                                                        o8888888o
//                                                        88" . "88
//                                                        (| -_- |)
//                                                         O\ = /O
//                                                     ____/`---'\____
//                                                   .   ' \\| |// `.
//                                                    / \\||| : |||// \
//                                                  / _||||| -:- |||||- \
//                                                    | | \\\ - /// | |
//                                                  | \_| ''\---/'' | |
//                                                   \ .-\__ `-` ___/-. /
//                                                ___`. .' /--.--\ `. . __
//                                             ."" '< `.___\_</>_/___.' >'"".
//                                            | | : `- \`.;`\ _ /`;.`/ - ` : | |
//                                              \ \ `-. \_ __\ /__ _/ .-` / /
//                                      ======`-.____`-.___\_____/___.-`____.-'======
//                                                         `=---='
//
//                                      .............................................
//                                             佛祖保佑             永无BUG