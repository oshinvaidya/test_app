import 'package:flutter/material.dart';
import 'package:test_app/contract/LoginContract.dart';
import 'package:test_app/model/LoginResponseModel.dart';
import 'package:test_app/presenter/LoginPresenter.dart';
import 'package:test_app/utils/FetchException.dart';
import 'package:test_app/utils/Preferences.dart';
import 'package:test_app/utils/Toast.dart';

import 'HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginContract {
  late LoginPresenter loginPresenter;
  late LoginContract loginContract;
  late LoginRequestModel loginRequestModel;
  late LoginResponseModel loginResponseModel;

  _LoginScreenState() {
    loginPresenter = LoginPresenter(this);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();
  late String _email;
  late String _password;
  late String _displayName;
  bool _obsecure = false;
  bool isApiCallProcess = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomPadding: false,
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              logo(),
              SizedBox(
                height: 20.0,
              ),
              _emailinput(),
              // SizedBox(
              //   height: 20.0,
              // ),
              _passwordinput(),
              SizedBox(
                height: 40.0,
              ),
              button(),
            ],
          ),
        ));
  }

  login() {
    setState(() {
      isApiCallProcess = true;
      Preference.setUserEmail(_emailController.text);
    });
    loginRequestModel = LoginRequestModel();
    loginRequestModel.email = _emailController.text.trim();
    loginRequestModel.password = _passwordController.text.trim();
    loginPresenter.login(loginRequestModel, 'login');
  }

  //GO logo widget
  Widget logo() {
    return Center(
        child: Padding(
      padding: EdgeInsets.only(top: 120),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 240,
        child: Stack(
          children: <Widget>[
            Positioned(
                child: Container(
              child: Align(
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  width: 150,
                  height: 150,
                ),
                alignment: Alignment.center,
              ),
              height: 154,
            )),
            Positioned(
              child: Container(
                  height: 154,
                  width: MediaQuery.of(context).size.width,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "GO",
                      style: TextStyle(
                        fontSize: 120,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  )),
            ),
            Positioned(
              width: 60,
              height: 60,
              top: 140,
              left: 260,
              child: Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              ),
            ),
            Positioned(
              width: 30,
              height: 30,
              top: 200,
              left: 230,
              child: Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget filledButton(
      String text,
      // Color splashColor, Color highlightColor,
      //  Color fillColor, Color textColor,
      void function()) {
    return RaisedButton(
      highlightElevation: 0.0,
//      splashColor: splashColor,
//      highlightColor: highlightColor,
      elevation: 0.0,
      // color: fillColor,
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.red, fontSize: 20),
      ),
      onPressed: () {
        function();
      },
    );
  }

  Widget button() {
    return OutlineButton(
      highlightedBorderColor: Colors.white,
      borderSide: BorderSide(color: Colors.white, width: 2.0),
      highlightElevation: 0.0,
      splashColor: Colors.white,
      highlightColor: Theme.of(context).primaryColor,
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(30.0),
      ),
      child: Text(
        "  LOGIN  ",
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
      ),
      onPressed: () {
        login();
      },
    );
  }

  //input widget
  Widget _emailinput() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: _emailController,
        obscureText: false,
        style: TextStyle(
          fontSize: 20,
        ),
        decoration: InputDecoration(
          hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          hintText: 'Email',
          labelText: 'Email',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 3,
            ),
          ),
          // prefixIcon: Padding(
          //   child: IconTheme(
          //     data: IconThemeData(color: Theme.of(context).primaryColor),
          //     child: icon,
          //   ),
          //   padding: EdgeInsets.only(left: 30, right: 10),
          // )
          //
        ),
      ),
    );
  }

  //input widget
  Widget _passwordinput() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: _passwordController,
        obscureText: true,
        style: TextStyle(
          fontSize: 20,
        ),
        decoration: InputDecoration(
          hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          hintText: 'Password',
          labelText: 'Password',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 3,
            ),
          ),
          // prefixIcon: Padding(
          //   child: IconTheme(
          //     data: IconThemeData(color: Theme.of(context).primaryColor),
          //     child: icon,
          //   ),
          //   padding: EdgeInsets.only(left: 30, right: 10),
          // )
          //
        ),
      ),
    );
  }

  @override
  void failureLogin(FetchException exception) {
    setState(() {
      isApiCallProcess = false;
    });
    print(exception.toString());
  }

  @override
  void successLogin(LoginResponseModel, url) {
    setState(() {
      isApiCallProcess = false;
    });
    print('success');
    toast().showToast('Login Successful');
    setState(() {
      Preference.setIsLogin(true);
    });
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);
  }
}
