import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterPage extends StatefulWidget {
  TwitterPage({Key? key}) : super(key: key);

  @override
  State<TwitterPage> createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {
  bool animate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            animate = true;
          });
        },
        backgroundColor: Colors.amber,
        child: FaIcon(FontAwesomeIcons.play),
      ),
      backgroundColor: Color(0xff1da1f2),
      body: Center(
        child: ZoomOut(
          animate: animate, //Detiene/inicia animacion
          duration: Duration(milliseconds: 1000),
          from: 30,
          child: FaIcon(
            FontAwesomeIcons.twitter,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}
