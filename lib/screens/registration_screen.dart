
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}


Widget _buildEmailTF(String field_name) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 60.0,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.grey.shade300,
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.email,
              color: Colors.grey.shade300,
            ),
            hintText: 'Enter your '+field_name,
            hintStyle: kHintTextStyle,
          ),
        ),
      ),
    ],
  );
}
Widget _buildLoginBtn(BuildContext context) {
  return GestureDetector(
    onTap: ()  {
      Navigator.pop(context);
    },
    child: RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an Account? ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: 'Log In',

            style: TextStyle(
              color: Colors.blue,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
Widget _buildSignUpBtn() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10.0),
    width: 170.0,
    child: RaisedButton(

      elevation: 5.0,
      onPressed: () => print('SignUp Button Pressed'),
      padding: EdgeInsets.all(15.0),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),

      ),
      color: Color(0xFF0148A4),
      child: Text(
        'CREATE',
        style: TextStyle(
          color: Colors.white,
          letterSpacing: 1.5,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
    ),
  );
}
class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                color: Color(0xFFF6F6F6),
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 40.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        child: Positioned(
                          top: 50,

                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                      Text(
                        'Let\'s get started!',
                        style: kLargeLabelStyle,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Create an account to Q Allure to get all features',
                        style: kLabelStyleRegular,
                      ),
                      SizedBox(height: 15.0),
                      _buildEmailTF('Name'),
                      SizedBox(
                        height: 15.0,
                      ),
                      _buildEmailTF('Email'),
                      SizedBox(
                        height: 15.0,
                      ),
                      _buildEmailTF('phone'),
                      SizedBox(
                        height: 15.0,
                      ),
                      _buildEmailTF('Password'),
                      SizedBox(
                        height: 15.0,
                      ),
                      _buildEmailTF('Confirm Password'),
                      SizedBox(
                        height: 15.0,
                      ),
                      _buildSignUpBtn(),
                      SizedBox(
                        height: 15.0,
                      ),
                      _buildLoginBtn(context),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
