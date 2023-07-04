import 'package:miapp11/pages/tabs/programas.dart';
import 'package:miapp11/pages/login_page.dart';
import 'package:miapp11/states/login_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:miapp11/pages/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'SIGAP';
    return Scaffold(
      body: Center(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: appTitle,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: {
            '/': (BuildContext context) => SplashScreen(),
            '/add': (BuildContext context) => ProgramasWidget(dni: ''),
            '/login': (BuildContext context) => LoginPage()
          },
        ),
      ),
    );
  }
}
