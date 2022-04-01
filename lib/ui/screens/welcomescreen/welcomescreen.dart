import 'package:flutter/material.dart';
import 'package:foodme/constant/padding.dart';
import 'package:foodme/ui/screens/loginscreen/loginscreen.dart';
import 'package:foodme/ui/screens/signupscreen/signupscreen.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static const String routeName = 'Welcome_screen';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const WelcomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/image/welcome.jpg'))),
          ),
          SizedBox(
            height: 40,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.routeName);
                  },
                  child: Container(
                    height: 50,
                    width: 170,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 22, 22, 22),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Text(
                        'Login',
                        style: GoogleFonts.recursive(
                          textStyle:
                              TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SignUpScreen.routeName);
                  },
                  child: Container(
                    height: 50,
                    width: 170,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 22, 22, 22),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Text('Sign Up',
                          style: GoogleFonts.recursive(
                            textStyle:
                                TextStyle(fontSize: 20, color: Colors.white),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
