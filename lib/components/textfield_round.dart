import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RoundTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

        child: new Theme(
          data: new ThemeData(
            primaryColor: Color(0xFF017DFE),
            primaryColorDark: Colors.transparent,
          ),
          child: new TextField(
            decoration: new InputDecoration(
                border: new OutlineInputBorder(

                  borderRadius: BorderRadius.circular(30.0),

                    borderSide: new BorderSide(color: Colors.teal)),
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.green,
                ),

                fillColor: Colors.white,
                prefixText: ' ',
                suffixStyle: const TextStyle(color: Colors.green)),
          ),
        ));


  }
}
