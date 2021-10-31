import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/screens/signup_screeen.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
                height: 400,
                child: SvgPicture.asset('assets/images/welcome.svg')),
            RichText(
              text: TextSpan(
                  text: 'Hi! We Are ',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0),
                  children: [
                    TextSpan(
                      text: '3x1',
                      style: TextStyle(color: KPrimaryColor, fontSize: 30.0),
                    ),
                    TextSpan(
                      text: '.io',
                      style: TextStyle(color: KPrimaryColor, fontSize: 25.0),
                    ),
                  ]),
            ),
            SizedBox(
              height: 10.0,
            ),
            Image.asset('assets/images/logo.png'),
            SizedBox(
              height: 15.0,
            ),
            Container(
              width: 270,
              child: Text(
                'Graphics, Marketing, Programming, All In One Place.',
                style: TextStyle(
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: KElevatedButtonStyle,
                    child: Text(
                      'LOGIN',
                      style: KTextButtonStyle,
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: LoginScreen(formKey: _formKey,),
                            );
                          });
                      print('login');
                    }),
                SizedBox(
                  width: 30.0,
                ),
                ElevatedButton(
                    style: KElevatedButtonStyle,
                    child: Text(
                      'REGISTER',
                      style: KTextButtonStyle,
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: SignupScreen(formKey: _formKey,),
                            );
                          });
                      print('SignUp');
                    }),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            // ElevatedButton.icon(onPressed: (){}, icon:Icon(Icons.person, semanticLabel: 'Sign up with Google',),
            ElevatedButton.icon(
              onPressed: () {
                print('Sign up with Google');
              },
              icon: SvgPicture.asset(
                'assets/icons/google.svg',
                width: 35.0,
              ),
              label: Text(
                'Sign up with Google',
                style: TextStyle(fontSize: 18.0),
              ),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black54),
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shadowColor: MaterialStateProperty.all(Colors.blueGrey),
                elevation: MaterialStateProperty.all(2.5),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
