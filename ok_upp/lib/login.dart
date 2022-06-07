import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ok_upp/Provider/google_sign_in.dart';
import 'package:ok_upp/data.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .51,
            decoration: const BoxDecoration(
                color: Color(0xFFF5CEB8),
                image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
                )),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          alignment: Alignment.center,
                          height: 52,
                          width: 52,
                          decoration: const BoxDecoration(
                            color: Color(0xFFF2BEA1),
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset("assets/icons/menu.svg"),
                        ),
                      ),
                    ),
                    const Text(
                      "CHKL",
                      style: TextStyle(
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(-1, 7.0),
                            blurRadius: 10,
                            color: Color.fromARGB(255, 175, 148, 148),
                          ),
                        ],
                        fontFamily: "Cairo",
                        fontWeight: FontWeight.w900,
                        fontSize: 35,
                        height: 1,
                      ),
                    ),
                    const Text(
                      "Lift Management System \n",
                      style: TextStyle(
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(-1, 7.0),
                            blurRadius: 10,
                            color: Color.fromARGB(255, 175, 148, 148),
                          ),
                        ],
                        fontFamily: "Cairo",
                        fontWeight: FontWeight.w900,
                        fontSize: 25,
                        height: 1,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/chkllogo.png',
                          height: 200,
                        ),
                      ],
                    ),
                    Container(
                      height: 15,
                    ),
                    Container(
                      height: 270,
                      padding: const EdgeInsets.only(left: 32),
                      child: Swiper(
                        pagination: const SwiperPagination(
                          builder: DotSwiperPaginationBuilder(
                            color: Colors.grey,
                            activeColor: Color(0xff38547C),
                            activeSize: 10,
                            space: 8,
                          ),
                        ),
                        itemCount: chonghwaenv.length,
                        itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                        layout: SwiperLayout.STACK,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: <Widget>[
                              const SizedBox(height: 100),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Image.asset(
                                  chonghwaenv[index].image,
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                    Container(
                      height: 45,
                    ),
                    Container(
                      margin: const EdgeInsets.all(25),
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(15),
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                        ),
                        icon: const FaIcon(FontAwesomeIcons.google),
                        label: const Text(
                          'Log in with Google',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w100,
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () {
                          final provider = Provider.of<GoogleSignInProvider>(
                              context,
                              listen: false);
                          provider.googleLogin();
                        },
                      ),
                    ),
                    Container(
                      height: 25,
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        '©2022 Chong Hwa Independent High School Kuala Lumpur',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Developed By Lee Sen Hong, Lee Jia Jun and Choy Min Han',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}