import 'dart:async';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

//import 'package:miapp11/states/login_state.dart';
//import 'package:miapp11/pages/home_page.dart';
import 'package:miapp11/pages/login_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 2), _onShowLogin);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _onShowLogin() {
    if (mounted) {
      Navigator.of(context).pushReplacement(generateRoute(context));
    }
  }

  static Route<dynamic> generateRoute(context) {
    /*  var state = Provider.of<LoginState>(context);
    if (state.isLoggedIn()) {
      var user;
      return MaterialPageRoute(builder: (context) => HomePage(usuario: user));
    } else { */
    return MaterialPageRoute(builder: (context) => LoginPage());
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.indigo[700],
        child: Center(
          heightFactor: 10,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 200,
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: FractionallySizedBox(
                    widthFactor: 0.7,
                    //child: Icon(Icons.account_box),
                    child: Image.asset('assets/white_logo.png'),
                  ),
                ),
              ),
              Text(
                'SIGAP-COVID-SplashScreen',
                style: TextStyle(
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: Colors.white),
              ),
              SafeArea(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 25.0, horizontal: 16.0),
                  alignment: Alignment.bottomCenter,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
