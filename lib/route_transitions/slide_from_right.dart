import 'package:flutter/material.dart';

class SlideFromRight extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;

  SlideFromRight({this.exitPage, this.enterPage})
      : super(
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) =>
                enterPage,
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) {
              var curve = Curves.easeInOutCirc;
              return Stack(
                children: <Widget>[
                  SlideTransition(
                    position: new Tween<Offset>(
                      begin: const Offset(0.0, 0.0),
                      end: const Offset(-.2, 0.0),
                    ).chain(CurveTween(curve: curve)).animate(animation),
                    child: exitPage,
                  ),
                  SlideTransition(
                    position: new Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).chain(CurveTween(curve: curve)).animate(animation),
                    child: enterPage,
                  )
                ],
              );
            });
}
