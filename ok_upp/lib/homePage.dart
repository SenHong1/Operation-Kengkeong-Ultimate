// ignore_for_file: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ok_upp/LiftDetail/liftA.dart';
import 'package:ok_upp/LiftDetail/liftB.dart';
import 'package:ok_upp/Provider/google_sign_in.dart';
import 'package:ok_upp/settingpage.dart';
import 'package:ok_upp/termsNconditions.dart';
import 'package:provider/provider.dart';

class LiftCard extends StatelessWidget {
  final String liftname;
  final String eta;
  final String currF;
  final String noPPl;
  final String liftState;
  final VoidCallback press;
  const LiftCard({
    Key? key,
    required this.liftname,
    required this.eta,
    required this.currF,
    required this.noPPl,
    required this.liftState,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(),
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
              color: Colors.black12,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  liftname,
                  style: const TextStyle(
                    fontSize: 43,
                    fontFamily: "Blackera",
                  ),
                ),
                Text(
                  'ETA: ' + eta,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: "Dosis",
                  ),
                ),
                Text(
                  'Curr. F: ' + currF,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: "Dosis",
                  ),
                ),
                Text(
                  'No. ppl: ' + noPPl,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: "Dosis",
                  ),
                ),
                Text(
                  'State: ' + liftState,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: "Dosis",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class HomePage extends StatefulWidget {
  static String liftnameA = 'A';
  static String etaA = '12:35pm';
  static String currFA = '10';
  static String noPPlA = '5';
  static String liftStateA = 'increasing';
  static String liftnameB = 'B';
  static String etaB = '12:27pm';
  static String currFB = '2';
  static String noPPlB = '2';
  static String liftStateB = 'decreasing';   
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {  
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  String ycurrFloorv = '?';
  List<String> ycurrFloor = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13'];  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      key: _key,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                user.displayName!,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ), 
              accountEmail: Text(
                user.email!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    user.photoURL!,
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,                     
                    ),
                ),
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/chonghwa1.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
           ),
           ListTile(
            leading: const Icon(Icons.description),
            title: const Text(
              'Terms & Condition',
              style: TextStyle(
                fontFamily: "Cairo",
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const TermsNConditions(),)),
           ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text(
                'Settings',
                style: TextStyle(
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingPage(),)),
            ),           
            const Divider(),           
            ListTile(
              leading: const Icon(FontAwesomeIcons.bell),
              title: const Text(
                'Emergency Push',
                style: TextStyle(
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.bold,
                ),
              ),
              // ignore: avoid_returning_null_for_void
              onTap: () => null,
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text(
                'Log Out',
                style: TextStyle(
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: (){
                final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.logout();
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget> [
          Container(
            height: size.height * .65,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 236, 200, 245),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/meditation_bg.png"),
              ),
            ),
          ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(           
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [
                  Row(
                    children: [
                        const Expanded(
                          flex: 9,
                          child: Text(
                            'DASHBOARD',
                            style: TextStyle(
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(-1.0, 7.0),
                                  blurRadius: 10,
                                  color: Color.fromARGB(255, 170, 148, 175),
                                ),
                              ],
                              fontFamily: "Cairo",
                              fontWeight: FontWeight.w900,
                              fontSize: 35,
                            ),
                          ),
                        ), 
                      InkWell(
                        onTap: () => _key.currentState!.openDrawer(),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage(user.photoURL!),
                            ),
                          ),
                        ),
                      ),
                  ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: [
                          const Text(
                              "Curr. Floor:",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Cairo",
                                fontSize: 25,
                                color: Colors.black87,
                                fontStyle: FontStyle.italic,
                              ),
                          ),
                          Text(
                            ycurrFloorv,
                            style: TextStyle(
                              fontSize: size.width *.42,
                              fontFamily: "News705",
                              color: Colors.black38,
                            ),
                          ),
                        ],
                      ),
                        Align(
                          child: Image.asset(
                            'assets/images/goldenLift.png',
                            height: 350,
                          ),
                        ),
                    ],
                  ),
                  Container(height: 20,),
                  Container(
                    height: 45,
                    width: size.width * .90,
                    padding:  const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(19),
                    ),
                    child: Row(
                      children:[
                        const FaIcon(
                            FontAwesomeIcons.search,
                            color: Colors.black26,
                        ),
                        Container(width: 10,),
                         const Expanded(
                          flex: 6,
                          child: Text(
                            'Your Current Floor...',
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: 17,
                            ),
                            ),
                         ),
                         Expanded(
                          flex: 1,
                          child: DropdownButton<String>(
                            value: null,
                            elevation: 16,
                            icon: const Icon(FontAwesomeIcons.chevronCircleDown),
                            items: ycurrFloor
                                  .map<DropdownMenuItem<String>>((String value){
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value, 
                                        style: const TextStyle(
                                          fontFamily: "News705",
                                          fontSize: 15,
                                          ),
                                        ),
                                    );
                                  }).toList(),
                            onChanged: (String? newValue) {
                                setState(() {
                                  ycurrFloorv = newValue!;
                                  // print(newValue);
                                });
                              },                          
                          ),
                         ),
                      ],
                    ),
                    ),
                    Container(height: 25,),
                    GridView.count(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      crossAxisCount: 2,
                      children: <Widget>[
                        LiftCard(
                          liftname: HomePage.liftnameA,
                          eta: HomePage.etaA,
                          currF: HomePage.currFA,
                          noPPl: HomePage.noPPlA,
                          liftState: HomePage.liftStateA,
                          // press: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LiftA(),)),
                          press: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const LiftA(),));
                          },
                        ),
                        LiftCard(
                          liftname: HomePage.liftnameB,
                          eta: HomePage.etaB,
                          currF: HomePage.currFB,
                          noPPl: HomePage.noPPlB,
                          liftState: HomePage.liftStateB,
                          press: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LiftB(),)),                    
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
        ],
      ),
    );
  }
}




// // ignore_for_file: file_names
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:ok_upp/Provider/google_sign_in.dart';
// import 'package:provider/provider.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser!;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("OKU Dashboard"),
//         centerTitle: true,
//         actions: [
//           TextButton(
//             onPressed: () {
//               // Create a provider that manages the state of logout and login
//               final provider =
//                   Provider.of<GoogleSignInProvider>(context, listen: false);
//               provider.logout();
//             },
//             child: const Text(
//               "Logout",
//               style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: Container(
//         alignment: Alignment.center,
//         color: const Color.fromRGBO(38, 50, 56, 1),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'Profile',
//               style: TextStyle(
//                 fontSize: 24,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(height: 32),
//             CircleAvatar(
//               radius: 40,
//               backgroundImage: NetworkImage(user.photoURL!),
//             ),
//             const SizedBox(height: 8),
//             Text('Name: ' + user.displayName!,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                 )),
//             const SizedBox(height: 8),
//             Text(
//               'Email: ' + user.email!,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }