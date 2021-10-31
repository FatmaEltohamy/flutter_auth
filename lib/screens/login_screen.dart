import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_core/firebase_core.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key, this.formKey}) : super(key: key);
  final  GlobalKey<FormState>? formKey;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? username,password;
  final FirebaseAuth auth=FirebaseAuth.instance;
  bool isHidden=false;
  checkAuthentication()async{
    auth.authStateChanges().listen((user) {
      if(user !=null){
        Navigator.push(context, MaterialPageRoute(builder:(context)=>HomeScreen()),);
      }
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.checkAuthentication();
  }
  login()async{
    if(widget.formKey!.currentState!.validate()){
      widget.formKey!.currentState!.save();
      try{
        // User user=await auth.signInWithEmailAndPassword(email: username!, password: password!);
      }
      catch(e){}
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Text(
            'Welcome Back!',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w300,
              fontSize: 30.0,
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
          SizedBox(
            height: 100.0,
          ),
          Form(
            key: widget.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 40.0),
                  child: TextFormField(
                    validator: (input){
                      if(input!.isEmpty){
                        return 'Enter Email';
                      }
                    },
                    onSaved: (input){
                      username=input;
                    },
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Username',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.8),
                  child: TextFormField(
                    validator: (input){
                      if(input!.length<6){
                        return 'Enter Password';
                      }
                    },
                    onSaved: (input){
                      password=input;
                    },
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
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    width: double.maxFinite,
                    height: 45.0,
                    child: ElevatedButton(
                        style: KElevatedButtonStyle,
                        child: Text(
                          "Login",
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
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    'Login with',
                    style: TextStyle(
                      color: Colors.black38,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/facebook.svg',height: 40.0,),
                      SizedBox(width: 20.0,),
                      SvgPicture.asset('assets/icons/google.svg', height: 38.0),
                      SizedBox(width: 20.0,),
                      SvgPicture.asset('assets/icons/linkedin.svg', height: 40.0),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
