//class Users {
class DetallePagos {
  String codAlumno;
  String nombreAlumno;
  String nombrePrograma;
  String estadoCivil;

  DetallePagos({
    required this.codAlumno,
    required this.nombreAlumno,
    required this.nombrePrograma,
    required this.estadoCivil,
  });

  factory DetallePagos.fromJson(Map<String, dynamic> json) {
    return DetallePagos(
      codAlumno: json['cod_alumno'],
      nombreAlumno: json['nombre_alumno'],
      nombrePrograma: json['nombre_programa'],
      estadoCivil: json['estado_civil'],
    );
  }
}
