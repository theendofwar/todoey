import 'package:flutter/material.dart';


// here is a costome button I build for the web
class RoundIconButton extends StatelessWidget {
  RoundIconButton(
      {required this.child,
      required this.onPressed,
      required this.width,
      required this.height,
      required this.fillcolor,
      required this.hovercolor});
  final Widget child;
  final void Function() onPressed;
  final double width;
  final double height;
  final Color hovercolor;
  final Color fillcolor;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      
      hoverColor: hovercolor,
      child: child,
      onPressed: onPressed,
      hoverElevation: 10,
      constraints: BoxConstraints.tightFor(width: width, height: height),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      fillColor: fillcolor,
    );
  }
}
