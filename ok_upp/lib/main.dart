import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:ok_upp/routerPage.dart';
import 'package:provider/provider.dart';
import 'Provider/google_sign_in.dart';
import 'package:ok_upp/splashScreen.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_logo');

    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
            requestAlertPermission: true,
            requestBadgePermission: true,
            requestSoundPermission: true,
            onDidReceiveLocalNotification: (
              int id,
              String? title,
              String? body,
              String? payload,
            ) async {
              showDialog(
                context: context,
                builder: (ctx) => CupertinoAlertDialog(
                  title: Text(title ?? ''),
                  content: Text(body ?? ''),
                  actions: [
                    CupertinoDialogAction(
                      child: const Text('ok'),
                      isDefaultAction: true,
                      onPressed: () async {
                        Navigator.of(ctx).pop();
                      },
                    )
                  ],
                ),
              );
            });

    const MacOSInitializationSettings initializationSettingsMacOS =
        MacOSInitializationSettings(
            requestAlertPermission: true,
            requestBadgePermission: true,
            requestSoundPermission: true);

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
      macOS: initializationSettingsMacOS,
    );

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? payload) async {
      if (payload != null) {
        debugPrint('notification payload: $payload');
      }
    });
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lift Management System',
        home: SplashScreen(),
      ));
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