import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NotificationsPage extends StatelessWidget {
  NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text(' Notifications Page'),
        ),
        floatingActionButton: FloatingButton(),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
}

class FloatingButton extends StatelessWidget {
  FloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.pink,
      onPressed: (() {
        final notiModelProvider =
            Provider.of<_NotificationModel>(context, listen: false);
        int numero = notiModelProvider.num;
        numero++;
        notiModelProvider.num = numero;

        if (numero >= 2) {
          //Accedo al controlador de la animacion Bounce y uso el forwar desde 0.0 para reanimar
          final controller = notiModelProvider.bounceController;
          controller.forward(from: 0.0);
        }
      }),
      child: FaIcon(FontAwesomeIcons.play),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int notifNum = Provider.of<_NotificationModel>(context).num;

    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [
        BottomNavigationBarItem(
            label: 'Bones', icon: FaIcon(FontAwesomeIcons.bone)),
        BottomNavigationBarItem(
            label: 'Notifications',
            icon: Stack(
              children: [
                FaIcon(FontAwesomeIcons.bell),
                Positioned(
                  top: 0.0,
                  right: 0.0,
                  //child: Icon(Icons.brightness_1,
                  //    size: 8, color: Colors.redAccent))
                  child: BounceInDown(
                    from: 10,
                    animate: notifNum > 0 ? true : false,
                    child: Bounce(
                      //Asigno el controllador de ESTA animacion y lo meto en el provider
                      controller: (controller) =>
                          Provider.of<_NotificationModel>(context)
                              .bounceController = controller,
                      from: 10,
                      child: Container(
                        child: Text(
                          '$notifNum',
                          style: TextStyle(color: Colors.white, fontSize: 7),
                        ),
                        alignment: Alignment.center,
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
        BottomNavigationBarItem(
            label: 'My Dog', icon: FaIcon(FontAwesomeIcons.dog)),
      ],
    );
  }
}

//Provider state model
class _NotificationModel extends ChangeNotifier {
  int _num = 0;
  AnimationController?
      _bounceController; //Recibira el controllador que exponen las animaciones de animateDo

  AnimationController get bounceController => this._bounceController!;

  set bounceController(AnimationController controller) {
    this._bounceController = controller;
  }

  int get num => this._num;

  set num(int value) {
    this._num = value;
    notifyListeners();
  }
}
