import 'package:flutter/material.dart';

import '../perfil_page.dart';
import 'package:miapp11/models/usuarioLogin.dart';

class PerfilWidget extends StatelessWidget {
  final UsuarioLogin alumno;

  const PerfilWidget({Key? key, required this.alumno}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PerfilUsuario(usuario: alumno),
    );
  }
}
