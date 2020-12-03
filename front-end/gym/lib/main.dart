import 'package:flutter/material.dart';

import 'view/loginView.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Academia',
    theme: ThemeData(primarySwatch: Colors.blue),
    home: LoginView(),
  ));
}
