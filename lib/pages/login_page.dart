import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miapp11/utilities/constants.dart';

//import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'package:miapp11/utilities/rest_api.dart';
import 'package:miapp11/pages/home_page.dart';
//import 'package:miapp11/states/login_state.dart';
//import 'package:miapp11/models/usuarioLogin.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usuarioController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFE0E7EB),
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(50),
                    bottomRight: const Radius.circular(50),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildLogo(),
                _buildContainer(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 70),
          child: Text(
            'POSGRADO',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Iniciar Sesión",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 30,
                      ),
                    ),
                  ],
                ),
                _buildEmailRow(),
                _buildPasswordRow(),
                _buildLoginButton(),
                _buildForgetPasswordButton(),
                _buildChangePasswordButton(),
                //SizedBox(height: 30),
                //_buildOrRow(),
                //_buildSocialBtnRow(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        controller: usuarioController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.person,
              color: kPrimaryColor,
            ),
            labelText: 'Usuario'),
      ),
    );
  }

  Widget _buildPasswordRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: passwordController,
        obscureText: true,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          labelText: 'Contraseña',
        ),
      ),
    );
  }

  Widget _buildForgetPasswordButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            createAlertRecuperarContrasenia(context);
          },
          child: Text(
            "Olvidé mi contraseña",
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChangePasswordButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            createAlertCambiarContrasenia(context);
          },
          child: Text(
            "Cambiar mi contraseña",
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1.4 * (MediaQuery.of(context).size.height / 20),
          width: 5 * (MediaQuery.of(context).size.width / 10),
          margin: EdgeInsets.all(2.0),
          child: MaterialButton(
            elevation: 5.0,
            color: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            onPressed: () async {
              var user = await ApiService.fetchLogin(
                  usuarioController.text, passwordController.text);
              if (user != null) {
                debugPrint("Usuario Validado");
                /* var state = Provider.of<LoginState>(context);
                state.username = usuarioController.toString();
                state.password = passwordController.toString();
                state.setLoggedIn(true); */
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(usuario: user),
                  ),
                );
              } else {
                var scaffoldMessengerKey;
                scaffoldMessengerKey.currentState!.showSnackBar(
                    SnackBar(content: Text("Wrong email or password")));
              }
            },
            child: Text(
              "Ingresar",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: MediaQuery.of(context).size.height / 40,
              ),
            ),
          ),
        )
      ],
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = ElevatedButton(
      child: Text(
        "aceptar",
        style: TextStyle(fontSize: 15.0),
      ),
      onPressed: () => Navigator.pop(context),
      //color: Colors.redAccent,
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("¿Error de Inicar Sesiòn?"),
      content: Text("Usuario o Contraseña Incorrecta"),
      actions: [
        okButton,
      ],
      elevation: 24.0,
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialogRecuperoContrasenia(BuildContext context) {
    // set up the button
    Widget okButton = ElevatedButton(
      child: Text(
        "Aceptar",
        style: TextStyle(fontSize: 15.0),
      ),
      onPressed: () => Navigator.pop(context),
      //color: Colors.green,
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Restablecimiento de Contraseña"),
      content: Text("Su usuario y contraseña es su dni"),
      actions: [
        okButton,
      ],
      elevation: 24.0,
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialogCambioContrasenia(BuildContext context) {
    // set up the button
    Widget okButton = ElevatedButton(
      child: Text(
        "Aceptar",
        style: TextStyle(fontSize: 15.0),
      ),
      onPressed: () => Navigator.pop(context),
      //color: Colors.green,
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Cambio Su contraseña"),
      content: Text("Ingrese con su nuevo possword"),
      actions: [
        okButton,
      ],
      elevation: 24.0,
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialogNoRecuperoContrasenia(BuildContext context) {
    // set up the button
    Widget okButton = ElevatedButton(
      child: Text(
        "Aceptar",
        style: TextStyle(fontSize: 15.0),
      ),
      onPressed: () => Navigator.pop(context),
      //color: Colors.redAccent,
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Error"),
      content:
          Text("No se pudo restablecer. Verifique que escribio bien los datos"),
      actions: [
        okButton,
      ],
      elevation: 24.0,
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialogNoCambioContrasenia(BuildContext context) {
    // set up the button
    Widget okButton = ElevatedButton(
      child: Text(
        "Aceptar",
        style: TextStyle(fontSize: 15.0),
      ),
      onPressed: () => Navigator.pop(context),
      //color: Colors.redAccent,
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Error"),
      content: Text(
          "No se pudo cambiar contraseña. Verifique que escribio bien los datos"),
      actions: [
        okButton,
      ],
      elevation: 24.0,
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  //Widget _buildSignUpBtn() {
  //  return Row(
  //    mainAxisAlignment: MainAxisAlignment.center,
  //    children: <Widget>[
  //      Padding(
  //        padding: EdgeInsets.only(top: 40),
  //        child: FlatButton(
  //          onPressed: () {},
  //          child: RichText(
  //            text: TextSpan(children: [
  //              TextSpan(
  //                text: 'Dont have an account? ',
  //                style: TextStyle(
  //                  color: Colors.black,
  //                  fontSize: MediaQuery.of(context).size.height / 40,
  //                  fontWeight: FontWeight.w400,
  //                ),
  //              ),
  //              TextSpan(
  //                text: 'Sign Up',
  //                style: TextStyle(
  //                  color: mainColor,
  //                  fontSize: MediaQuery.of(context).size.height / 40,
  //                  fontWeight: FontWeight.bold,
  //                ),
  //              )
  //            ]),
  //          ),
  //        ),
  //      ),
  //    ],
  //  );
  //}
  createAlertCambiarContrasenia(BuildContext context) {
    var usuario, email, password;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Cambiar contraseña"),
            content: Stack(
              children: <Widget>[
                Form(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(hintText: "Ingrese Usuario"),
                      onChanged: (value) {
                        setState(() {
                          usuario = value;
                        });
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: "Ingrese Email"),
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    TextField(
                      decoration:
                          InputDecoration(hintText: "Ingrese nueva contraseña"),
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                  ],
                ))
              ],
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 0.5,
                child: Text('Recuperar'),
                onPressed: () async {
                  //Relizar recuperacion
                  var url =
                      "http://137.184.120.127/usuario/alumnoprograma/actualizar/" +
                          usuario +
                          "/" +
                          email +
                          "/" +
                          password;
                  url = url.trim();

                  debugPrint("cambiar password: " + url);
                  var client = http.Client();
                  var uri = Uri.parse(url);
                  var response = await client.get(uri);
                  if (response.statusCode == 200) {
                    debugPrint("recupero ok");
                    Navigator.of(context).pop();
                    showAlertDialogCambioContrasenia(context);
                  } else {
                    debugPrint("error al recuperar");
                    showAlertDialogNoCambioContrasenia(context);
                  }
                },
              )
            ],
          );
        });
  }

  createAlertRecuperarContrasenia(BuildContext context) {
    var recuperarUsuario, recuperarEmail;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Recuperar contraseña"),
            content: Stack(
              children: <Widget>[
                Form(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(hintText: "Ingrese Usuario"),
                      onChanged: (value) {
                        setState(() {
                          recuperarUsuario = value;
                        });
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: "Ingrese Email"),
                      onChanged: (value) {
                        setState(() {
                          recuperarEmail = value;
                        });
                      },
                    ),
                  ],
                ))
              ],
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 0.5,
                child: Text('Recuperar'),
                onPressed: () async {
                  //Relizar recuperacion
                  var url =
                      "http://137.184.120.127/usuario/alumnoprograma/cambiar/" +
                          recuperarEmail +
                          "/" +
                          recuperarUsuario;
                  url = url.trim();
                  debugPrint("recuperar link: " + url);
                  var client = http.Client();
                  var uri = Uri.parse(url);
                  var response = await client.get(uri);
                  if (response.statusCode == 200) {
                    debugPrint("recupero ok");
                    Navigator.of(context).pop();

                    showAlertDialogRecuperoContrasenia(context);
                  } else {
                    debugPrint("error al recuperar");
                    showAlertDialogNoRecuperoContrasenia(context);
                  }
                },
              )
            ],
          );
        });
  }
}

//Center(
//     child: Consumer<LoginState>(
//           builder: (BuildContext context , LoginState value , Widget child){
//             if(value.isLoading()){
//               return CircularProgressIndicator();
//             }else {
//               return child;
//             }
//           },
//           child: RaisedButton(
//             child: Text("Sign In"),
//             onPressed: (){
//               Provider.of<LoginState>(context).login();
//             }
//           ),
//         )
//      ),
