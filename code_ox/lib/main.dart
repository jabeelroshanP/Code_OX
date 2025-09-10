import 'package:code_ox/controller/dropDownProvider.dart';
import 'package:code_ox/controller/provider.dart';
import 'package:code_ox/view/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => ProductProvider()),
    ChangeNotifierProvider(create: (context) => DropdownProvider()),
    ],
      child: MaterialApp(
        home: Homepage(),
      ),
    );
  }
}