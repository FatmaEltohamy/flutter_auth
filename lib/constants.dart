import 'package:flutter/material.dart';
const KPrimaryColor=Color(0xff1565c0);
const KSecondaryColor=Color(0xffe3f2fd);
final KElevatedButtonStyle= ElevatedButton.styleFrom(
  primary:KPrimaryColor,
  shadowColor: Colors.blueGrey,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
  ),
);
const KTextButtonStyle= TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);