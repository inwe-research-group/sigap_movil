import 'package:miapp11/models/alumnoprograma.dart';
import 'package:miapp11/models/beneficio.dart';
import 'package:miapp11/models/usuarioLogin.dart';
import 'package:miapp11/models/recaudacionesAlumno.dart';
import 'package:http/http.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class URLS {
  static const String BASE_URL = 'http://137.184.120.127:8081';
}

class ApiService {
  static Future<List<AlumnoPrograma>> fetchProgamas(String dniM) async {
    var client = http.Client();
    var uri = Uri.parse('${URLS.BASE_URL}/alumnoprograma/buscard/$dniM');
    print(uri);
    Response response = await client.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      List jsonResponse = json.decode(response.body);
      print(jsonResponse);
      return jsonResponse
          .map((programa) => AlumnoPrograma.fromJson(programa))
          .toList(growable: true);
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  static Future<UsuarioLogin> fetchLogin(
      String usuario, String password) async {
    var client = http.Client();
    var url =
        '${URLS.BASE_URL}/usuario/alumnoprograma/buscar/$usuario/$password';
    url = url.trim();
    //print(url);
    var uri = Uri.parse(url);
    Response response = await client.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      //print(response.body);
      return UsuarioLogin.fromJson(json.decode(response.body));
    } else if (response.statusCode == 500) {
      throw Exception("Incorrect Email/Password");
    } else {
      throw Exception('Error de Autenticacion');
    }
  }

  static Future<List<RecaudacionesAlumno>> fetchRecaudaciones(
      String codAlumno) async {
    var client = http.Client();
    var uri = Uri.parse(
        '${URLS.BASE_URL}/recaudaciones/alumno/concepto/listar_cod/$codAlumno');
    Response response = await client.get(uri);

    if (response.statusCode == 200 || response.statusCode == 201) {
      List jsonResponse = json.decode(response.body);
      print('/recaudaciones/alumno/concepto/listar_cod');
      print(jsonResponse);
      return jsonResponse
          .map((json) => RecaudacionesAlumno.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  static Future<List<Beneficio>> fetchBeneficio(String codAlumno) async {
    var client = http.Client();
    var uri = Uri.parse('${URLS.BASE_URL}/beneficio/listar/$codAlumno');
    Response response = await client.get(uri);

    if (response.statusCode == 200 || response.statusCode == 201) {
      List jsonResponse = json.decode(response.body);

      print(jsonResponse);
      return jsonResponse.map((json) => Beneficio.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  static Future<List<dynamic>> getFiles(String tipoGrado, String anioIngreso,
      String codigoNombre, String idRecaudacion) async {
    var client = http.Client();
    var uri = Uri.parse(
        '${URLS.BASE_URL}/v1/storage/getFileFromFolder/$tipoGrado/$anioIngreso/$codigoNombre/$idRecaudacion');
    Response response = await client.get(uri);

    List decodedData = json.decode(response.body);
    List filesRec = [];
    if (decodedData.isNotEmpty) {
      decodedData.forEach((element) {
        filesRec.add(element['url']);
      });
      print(filesRec);
    } else {
      print('[]');
      return [];
    }

    return filesRec;
  }
}
