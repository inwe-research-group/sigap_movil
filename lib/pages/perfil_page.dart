import 'package:miapp11/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:miapp11/models/usuarioLogin.dart';

class PerfilUsuario extends StatelessWidget {
  final UsuarioLogin usuario;

  const PerfilUsuario({Key? key, required this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          title: const Text('DATOS PERSONALES'),
          backgroundColor: kPrimaryColor,
          //bottom: getTabBar(),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            ListTile(
              title: Text("Nombre Completo",
                  style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text(usuario.nomAlumno +
                  " " +
                  usuario.apePaterno +
                  " " +
                  usuario.getApeMaterno),
              leading: Icon(Icons.person, color: kSecondaryColor),
            ),
            ListTile(
              title:
                  Text("Correo", style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text(usuario.getEmail),
              leading: Icon(Icons.email, color: kSecondaryColor),
            ),
            ListTile(
              title: Text("DNI", style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text(usuario.getDni),
              leading: Icon(Icons.chrome_reader_mode, color: kSecondaryColor),
            )
          ],
        ),
      ),
    );
  }

  /*  String getEmail() {
    String? correo = usuario.mail;
    if (correo == null) correo = "SIN CORREO ELECTRONICO";

    return correo;
  }

  String getDniM() {
    String? dni = usuario.dniM;
    if (dni == null) dni = "SIN DNI";
    return dni;
  } */
}
