import 'dart:html';

import 'package:flutter/material.dart';
import 'package:foodme/constant/colors.dart';
import 'package:foodme/constant/padding.dart';
import 'package:foodme/ui/screens/homescreen/homescreen.dart';
import 'package:foodme/ui/screens/signupscreen/signupscreen.dart';
import 'package:foodme/ui/widget/passwordfromtext.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constant/fontsize.dart';
import '../../widget/phonesnumberfrontext.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  static const String routeName = 'Login_screen';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => LoginScreen(),
    );
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(mainPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Text(
                  'Login',
                  style: GoogleFonts.recursive(
                    textStyle: TextStyle(
                        fontSize: titleFontSize * 4,
                        color: Colors.black,
                        shadows: [
                          BoxShadow(blurRadius: 1, offset: Offset(2, 2))
                        ]),
                  ),
                ),
              ),
              SizedBox(
                height: topMainPadding,
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Phone Number ', style: GoogleFonts.recursive()),
                    SizedBox(
                      height: topMainPadding,
                    ),
                    TextFormNumber(
                      icon: Icons.phone,
                      hintText: ('Enter Phone Number'),
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'Required'),
                        EmailValidator(errorText: 'Enter Valid Number')
                      ]),
                    ),
                    SizedBox(
                      height: mainPadding * 1.3,
                    ),
                    Text(
                      'Password ',
                      style: GoogleFonts.recursive(),
                    ),
                    SizedBox(
                      height: topMainPadding,
                    ),
                    PasswordUserFormFiled(
                      icon: Icons.lock,
                      hintText: ('Enter Password'),
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'Required'),
                        EmailValidator(errorText: 'Enter Valid Password')
                      ]),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Center(
                      child: MaterialButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.pushReplacementNamed(
                                context, HomeScreen.routeName);
                          }
                        },
                        child: Container(
                          height: 50,
                          width: 170,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 0, 0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Center(
                            child: Text('Login',
                                style: GoogleFonts.recursive(
                                  textStyle: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                )),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Our Sign Up With',
                          style: GoogleFonts.recursive(
                              textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          )),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, SignUpScreen.routeName);
                            },
                            child: Text('Sign Up',
                                style: GoogleFonts.recursive(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                                ))),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
