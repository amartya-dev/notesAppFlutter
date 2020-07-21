import 'package:flutter/material.dart';
import 'package:notes_flutter_app/ui/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        canvasColor: Colors.transparent
      ),
      //Our only screen/page we have
      home: HomePage(title: 'My Notes List'),
    );
  }
}
