import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ok_upp/Provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
        colors: [Colors.green, Colors.blue])
      ),
      child: Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const Align(
            child: Text(
              'CHKL OPERATION \nKENGKEONG ULTIMATE\n\n(Lift Management System)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              )
            ),
          ),
          Image.asset(
            'assets/chkllogo.png',
            height: 180,
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Hey There,\nWelcome Back',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Login to your account to continue',
              style: TextStyle(fontSize: 16),
            )
          ),
          const Spacer(),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(10),
              primary: Colors.white,
              onPrimary: Colors.black,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(27.0),
              ),
            ),
            icon: const FaIcon(FontAwesomeIcons.google),
            label: const Text('Log in with Google'),
            onPressed: () {
              final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googleLogin();
            },
          ),
          const SizedBox(height: 40),
          RichText(
            text: TextSpan(
              text: '©2021 Chong Hwa Independent High School Kuala Lumpur',
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey[300],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Developed By Lee Sen Hong, Lee Jia Jun and Choy Min Han',
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey[300],
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
  ),
    );
  }
}

// pub dev packages
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:ok_upp/Provider/google_sign_in.dart';
// import 'package:provider/provider.dart';

// class SignUpWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => Padding(
//     padding: EdgeInsets.all(32),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Spacer(),
//         Align(
//           child: Text(
//             'CHKL OPERATION PBH',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 25,
//             )
//           ),
//         ),
//         Image.asset(
//           'assets/chkllogo.png',
//           height: 180,
//         ),
//         Spacer(),
//         Align(
//           alignment: Alignment.centerLeft,
//           child: Text(
//             'Hey There,\nWelcome Back',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         Align(
//           alignment: Alignment.centerLeft,
//           child: Text(
//             'Login to your account to continue',
//             style: TextStyle(fontSize: 16),
//           )
//         ),
//         Spacer(),
//         ElevatedButton.icon(
//           style: ElevatedButton.styleFrom(
//             padding: EdgeInsets.all(10),
//             primary: Colors.white,
//             onPrimary: Colors.black,
//             minimumSize: Size(double.infinity, 50),
//             shape: new RoundedRectangleBorder(
//               borderRadius: new BorderRadius.circular(27.0),
//             ),
//           ),
//           icon: FaIcon(FontAwesomeIcons.google),
//           label: Text('Log in with Google'),
//           onPressed: () {
//             final provider =
//               Provider.of<GoogleSignInProvider>(context, listen: false);
//           provider.googleLogin();
//           },
//         ),
//         SizedBox(height: 40),
//         RichText(
//           text: TextSpan(
//             text: '©2021 Chong Hwa Independent High School Kuala Lumpur',
//             style: TextStyle(
//               fontSize: 10,
//               color: Colors.grey[300],
//             ),
//           ),
//         ),
//         Align(
//           alignment: Alignment.center,
//           child: Text(
//             'Developed By Lee Sen Hong, Lee Jia Jun and Choy Min Han',
//             style: TextStyle(
//               fontSize: 10,
//               color: Colors.grey[300],
//             ),
//           ),
//         ),
//         Spacer(),
//       ],
//     ),
//   );
// }