import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: const Text(
            'Notifications Page',
            style: TextStyle(color: Colors.white),
          ),
        ),
        floatingActionButton: const FloatingButton(),
        bottomNavigationBar: const BottomNavigation(),
      ),
    );
  }
}

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.pink,
      child: const FaIcon(FontAwesomeIcons.play, color: Colors.white),
      onPressed: () {
        final notificationModel = Provider.of<_NotificationModel>(
          context,
          listen: false,
        );

        int notificationNumber = notificationModel.number + 1;

        // notificationNumber++;

        notificationModel.number = notificationNumber;

        // Provider.of<_NotificationModel>(context, listen: false).number =
        //     Provider.of<_NotificationModel>(context, listen: false).number + 1;

        if (notificationNumber >= 2) {
          notificationModel.bounceController.forward(from: 0.0);
        }
      },
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final int notificationNumber =
        Provider.of<_NotificationModel>(context).number;

    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [
        const BottomNavigationBarItem(
          label: 'Bones',
          icon: FaIcon(FontAwesomeIcons.bone),
        ),
        BottomNavigationBarItem(
          label: 'Notifications',
          icon: Stack(
            children: [
              const FaIcon(FontAwesomeIcons.bell),
              Positioned(
                top: 0.0,
                right: 0.0,
                // child: Icon(
                //   Icons.brightness_1,
                //   size: 8,
                //   color: Colors.redAccent,
                // ),
                child: BounceInDown(
                  from: 10,
                  animate: (notificationNumber > 0) ? true : false,
                  child: Bounce(
                    from: 10,
                    controller:
                        (controller) =>
                            Provider.of<_NotificationModel>(context)
                                .bounceController = controller,

                    child: Container(
                      width: 12,
                      height: 12,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.redAccent,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '$notificationNumber',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 7,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const BottomNavigationBarItem(
          label: 'My Dog',
          icon: FaIcon(FontAwesomeIcons.dog),
        ),
      ],
    );
  }
}

class _NotificationModel extends ChangeNotifier {
  int _number = 0;
  late AnimationController bounceController;

  int get number => _number;
  set number(int value) {
    _number = value;
    notifyListeners();
  }

  // AnimationController get bounceController => _bounceController;
  // set bounceController(AnimationController controller) {
  //   _bounceController = controller;
  // }
}
