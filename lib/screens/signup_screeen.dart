import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key,this.formKey}) : super(key: key);
  final formKey;

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
 bool isHidden=false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          RichText(
            text: TextSpan(
             text: 'Welcome Back!     ',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
                fontSize: 30.0,
              ),
              children: [
                TextSpan(
                  text:'Please enter valid information to access your account',
                    style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15.0),
                  ),
              ]
            ),
          ),

          Positioned(
            right: -40.0,
            top: -40.0,
            child: InkResponse(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                child: Icon(Icons.close),
                backgroundColor: Colors.red,
              ),
            ),
          ),

          Form(
            key: widget.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 90.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      hintText: 'Email',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Username',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.0),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !isHidden,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      hintText: 'Password',
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isHidden=!isHidden;
                            });
                          }, icon: Icon(isHidden?Icons.visibility:Icons.visibility_off,)),

                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.0),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !isHidden,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      hintText: 'Confirm Password',
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isHidden=!isHidden;
                            });
                          }, icon: Icon(isHidden?Icons.visibility:Icons.visibility_off,)),

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    width: double.maxFinite,
                    height: 45.0,
                    child: ElevatedButton(
                        style: KElevatedButtonStyle,
                        child: Text(
                          "Register",
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2),
                        ),
                        onPressed: () {}
                      // if (_formKey.currentState.validate()) {
                      // _formKey.currentState.save();
                      // }
                      // },
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
