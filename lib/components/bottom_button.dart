import 'package:flutter/material.dart';
import 'package:flutter_starter_app/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.buttonTitle});

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
       alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xFF017DFE),
            borderRadius: BorderRadius.all(Radius.circular(50))
        ),
        child: Center(

          child: Text(
            buttonTitle,
            style: kLoginButtonTextStyle,
          ),
        ),

        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: 200.0,
        height: kBottomLoginButtonHeight,
      ),
    );
  }
}
