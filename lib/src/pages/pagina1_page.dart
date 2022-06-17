import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Pagina1Page extends StatelessWidget {
  Pagina1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animate_do'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: FaIcon(FontAwesomeIcons.twitter),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.navigate_next),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: FaIcon(FontAwesomeIcons.play),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.new_releases,
              color: Colors.blue,
              size: 40,
            ),
            Text(
              'Title',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200),
            ),
            Text(
              'I am a small text ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            Container(
              width: 200,
              height: 2,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
